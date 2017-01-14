
this Dockerfile tests current h2o-future archlinux package.
the build contains a few PR's, notably redis access from mruby and kafka log output.

1. edit h2o.conf (and Dockerfile if you want to add more files, eg certificates)

2. run party_hard.sh to run a redis and h2o docker intance

3. profit!