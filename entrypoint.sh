#!/bin/bash
set -ex

rm -rf $HOME/.vnc
rm -rf /tmp/.X1*

if  [ -z "$PASSWORD" ] ; then
    PASSWORD=`pwgen -c -n -1 12`
    echo -e "PASSWORD=$PASSWORD" > $HOME/password.txt
fi

echo "$USER:$PASSWORD" | chpasswd

# Set up vncserver
su $USER -c "mkdir -p $HOME/.vnc && echo \"$PASSWORD\" | vncpasswd -f > $HOME/.vnc/passwd && chmod 600 $HOME/.vnc/passwd && touch $HOME/.Xresources"
chown -R $USER:$USER $HOME

if [ ! -z "$SUDO" ]; then
    case "$SUDO" in
        [yY]|[yY][eE][sS])
            adduser $USER sudo
    esac
fi

if [ ! -z "$NOPASSWD" ]; then
    case "$NOPASSWD" in
        [yY]|[yY][eE][sS])
            echo $USER   ALL=\(ALL\) NOPASSWD:ALL >> /etc/sudoers
    esac
fi

supervisord -c /container-resources/supervisord.conf
