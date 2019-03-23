# default confige for server
### nginx config
could be such `akaskhoone_nginx.conf`.

### gunicorn config
so by having a directory such `akaskhoone_server` in home direcotry, and inside
that directory we have 2 directories `akaskhoone` for server files and
`env_akaskhoone` for virtual environment, a service file neede such 
`akaskhoone_gunicorn.service` and an script file like `akaskhoone_gunicorn.sh`
too.
