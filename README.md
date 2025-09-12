# Gamification 2

minimal development setup steps:

```
nix develop github:chvp/nixos-config#gamification2
refresh-deps
yarn run build:css
server:start
```

while the server (or the database) is running, to setup the database:

```
rails db:setup
```

yay

to get some data:

```
bin/jobs start
```

the jobs will run silently for a long time, but if you let it run for a bit and then stop it, you will have some data
