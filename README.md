Docker-Pyload
=============

Sets up a container with [pyload](http://pyload.org/) and ssh-server installed listening on 8000,7227 and 22.

Usage
=============

To run the container, do the following:

    docker run -d -P jahroots/docker-pyload

    CONTAINER ID        IMAGE                           COMMAND                CREATED             STATUS              PORTS                                                                     NAMES
    3ba228da04ad        jahroots/docker-pyload:latest   /usr/bin/supervisord   4 seconds ago       Up 3 seconds        0.0.0.0:49165->22/tcp, 0.0.0.0:49166->7227/tcp, 0.0.0.0:49167->8000/tcp
    
    
Your pyload instance is now available by going to http://localhost:49167.
Username: admin Password: admin for pyload
Username: root  Password: root  for ssh
