# Docker SickRage

This is a Dockerfile to deploy SickRage.

## How to run

Here's how you can run the container :


`` docker run --restart=always --name sickrage -d -p 8081:8081 -v /etc/localtime:/etc/localtime:ro -v /<local-directory-for-config-files>:/data fgracia/sickrage ``



Where :

- --restart=always
  - allows to automatically restart the container if it stops, of if the host reboots.
- --name sickrage 
  - you can choose the name you want
- -d
  - daemon mode
- -p 8081:8081
  - maps the default port 8081. If you want to change it, you will be able to do it in the SickRage configuration.
- -v /etc/localtime:/etc/localtime:ro
  - sets the UTC like the host (optional)
- -v /<local-directory-for-config-files>:/data
  - if you want persistent config files, you can choose a local directory

If you use post-processing actions, you may need to mount other data volumes.


## Docker Compose

Because of an hard docker run command to remember, you can use docker-compose (see the YAML script in the compose folder). 
You will juste have to adapt data volumes and then run :

`` docker-compose up -d ``

