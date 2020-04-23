### scoleri/aws-azure-login-noashv

This is because cisco anyconnect on windows doesn't allow docker -v (GHETTTOOOO)

This allows you to login and it'll dump the credentials file so you can pipe it to ~/.aws/credentials or whatever the equiv in windows land is.

TODO:

USAGE:

you have to pass your azure environment - because it can't read it with -v (duh?)

$ docker run --env azure_tenant_id=XXXXX --env azure_app_id_uri=XXXXXX --env azure_default_username=steven.scoleri@XXXXX.org -it scoleri/aws-azure-login-nodashv:latest
