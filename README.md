# Ubuntu KDE Plasma desktop with Wine
This image is for deploy a general purpose desktop environment. It already includes Wine, browser and LibreOffice.

## Image Contents
- [TigerVNC](https://tigervnc.org/) - VNC server and X11 in a virtual framebuffer.
- [noNVC](https://novnc.com/) - VNC client JavaScript library, used to provide a browser VNC client.
- [KDE Plasma](https://kde.org/plasma-desktop/) - Plasma is a Desktop.
- [Firefox](https://www.mozilla.org/pt-BR/firefox) - Web browser.
- [Wine](https://www.winehq.org/) - Wine is a translation layer (a program launcher) capable of running Windows applications on Linux .
- [LibreOffice](https://www.libreoffice.org/) - LibreOffice is a free and powerful office suite.

## Usage

### Variables
You can specify the following variables:
- `DISPLAY_WIDTH=<width>` (1600)
- `DISPLAY_HEIGHT=<height>` (900)
- `SUDO={yes|no}` (yes) - Add user to sudo group
- `NOPASSWD={yes|no}` (yes) - Disable prompt for password when use sudo

### Demo
Start a desktop environment by setting a password.

```shell
docker run -d \
    -e PASSWORD=d3skt0p \
    -p 6080:8080 \
    -p 6081:5901 \
    --name ubuntu-desktop \
    andreyurisim/ubuntu-desktop-wine:latest
```

Two ports are exposed:
- 8080 - Web access to noVNC
- 5901 - Direct access to VNC

Open a browser and access noVNC at `http://<server>:6080`

## On DockerHub / GitHub
* DockerHub [andreyurisim/ubuntu-desktop-wine](https://hub.docker.com/repository/docker/andreyurisim/ubuntu-desktop-wine)
* GitHub [andreyurisim/ubuntu-desktop-wine](https://github.com/andreyurisim/ubuntu-desktop-wine)

# Thanks
This is based on [theasp/docker-novnc](https://github.com/theasp/docker-novnc) by Andrew Phillips and [chenjr0719/Docker-Ubuntu-Unity-noVNC](https://github.com/chenjr0719/Docker-Ubuntu-Unity-noVNC) by Jacob.