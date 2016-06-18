#SSL Development Gateway for Docker

This is a customized nginx docker image that will terminate SSL connections and
forward the request over plain HTTP to an origin server.  This is to facilitate
development of services that do not handle HTTPS directly but expect it to be
used by clients.

##Envvars

`ORIGIN_SERVER`: Set this to the hostname (and port if not 80) of the HTTP
service.  The SSL connection will be proxied to this server.  Ex. `my_app:5080`
(proxy to host `my_app` via HTTP on port 5080 or `wiki` (proxy to host
`wiki` via HTTP on port 80).

##Running
The SSL gateway runs on port 443 inside this container.  Here is an example
entry in a docker-compose development config file showing the use of this
service with a HTTP service called `app`:

    ssl:
      image: keitwb/ssl-dev-gateway
      ports:
        - "9443:443"
      environment:
        ORIGIN_SERVER: app:80

