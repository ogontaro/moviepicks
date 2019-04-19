# MoviePicks
MoviePicks is Youtube Ranking Site

## Development
### Init Env
```
$ cp ./server/.env.example ./server/.env
$ vim ./server/.env.example # add env
```

### Run app
```
$ docker-compose up -d
```

### Migration
```
$ docker-compose exec server bash -c "bundle exec rails db:migrate"
```

### RSpec
```
$ docker-compose exec server bash -c "bundle exec rspec"
```
