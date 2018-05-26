# Build container

**Clone repo**

* `cd ~/`
* `git clone https://github.com/LibreELEC/LibreELEC.tv.git LibreELEC`

**Build container**

* `cd ~/LibreELEC`
* `docker build --pull -t arturlwww/libreelecbuildsystemubuntu16.04 tools/dockerByArtUrlWWW`

**Build image inside container**

* `docker run -v ~/:/home/docker -h libreelec -it libreelec`
* `cd ~/LibreELEC`
* `make image`
