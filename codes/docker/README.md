Docker
======

Pulling a new image:
$ sudo docker pull  bowery/php

Launching an image:
$ sudo docker run -t -i ubuntu /bin/bash

Making a new image:
$ vim Dockerfile
$ sudo docker build .

Statsd/Graphite
===============
git clone https://github.com/hopsoft/docker-graphite-statsd.git
./docker-graphite-statsd/bin/star
