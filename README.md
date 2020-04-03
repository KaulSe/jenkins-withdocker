# Jenkins Server
This [docker image](https://github.com/KaulSe/jenkins-withdocker/) is a fork from `https://github.com/getintodevops/jenkins-withdocker`.
This image also contains the `docker-compose` binary and `terraform`.

You may want to use `docker-compose` to run this server:

```YAML
version: '3'

services:
  jenkins:
    image: kaulse/jenkins
    volumes:
      - jenkins_volume:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
    networks:
      traefik_webgateway:

volumes:
  jenkins_volume:
    external: true
```
You might get permissions errors with Jenkins and `/var/run/docker.sock`. I somehow fixed this locally, maybe with chmod (I tried too many ways).
I am not sure what the best practice is. I had this permission error also in another project and managed to fix it by adding
`user: root` to the docker-compose file. It might be not the best practice and maybe even a security issue.


