# docker-linux-gui
Run Linux in docker with a GUI and connect via rdp


    $ docker build -f Dockerfile.lubuntu -t ubuntu-desktop .
    $ docker run --name ubuntu-desktop-container -d -p 3389:3389 ubuntu-desktop