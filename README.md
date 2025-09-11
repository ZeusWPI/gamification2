# Gamification 2

minimal development setup steps:

```
nix develop github:chvp/nixos-config#gamification2
yarn run build:css
server:start
```

open the website
click "Create database"
click "Run pending migrations"

yay

to get some data, while the server is open:
```
rake db:seed
bin/jobs start
```

the jobs will run silently for a long time, but if you let it run for a bit and then stop it, you will have some data