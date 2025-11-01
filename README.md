# Gamification 2

Minimal development setup steps:

```
nix develop github:chvp/nixos-config#gamification2
refresh-deps
server:start
```

While the server (or the database) is running, set up the database with `rails
db:setup`. This will also automatically add a bunch of jobs which should start
loading data into your database.
