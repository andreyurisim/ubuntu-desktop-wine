FROM ubuntu:21.10

ENV USER=ubuntu \
    HOME=/home/ubuntu \
    SUDO=yes \
    NOPASSWD=yes \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:1 \
    DISPLAY_WIDTH=1600 \
    DISPLAY_HEIGHT=900

RUN export DEBIAN_FRONTEND=noninteractive && \
    adduser $USER --gecos "" --disabled-password && \
    apt-get update && \
    apt-get install -y \
        sudo \
        software-properties-common \
        bash \
        pwgen \
        net-tools \
        novnc \
        supervisor \
        firefox \
        zip \
        unzip \
        telnet \
        iputils-ping \
        gnupg2 \
        build-essential \
        rsync \
        htop \
        libreoffice \
        vim \
        tigervnc-standalone-server && \
    \
    cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html && \
    \
    add-apt-repository -y ppa:kubuntu-ppa/backports && \
    apt-get update && \
    apt-get install -y kubuntu-desktop && \
    \
    dpkg --add-architecture i386 && \
    wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
    sudo -H gpg -o /etc/apt/trusted.gpg.d/winehq.key.gpg --dearmor winehq.key && \
    rm winehq.key && \
    add-apt-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main' && \
    apt-get update && \
    apt-get install -y --install-recommends winehq-stable && \
    \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY . /container-resources


EXPOSE 8080 5901
CMD ["/container-resources/entrypoint.sh"]
