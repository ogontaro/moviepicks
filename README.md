# MoviePicks
MoviePicks is Youtube Ranking Site

[![CircleCI](https://circleci.com/gh/ogontaro/movie-picks/tree/master.svg?style=svg)](https://circleci.com/gh/ogontaro/movie-picks/tree/master)

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

## Author
[@ogontaro](https://twitter.com/)

## License
[MIT](http://b4b4r07.mit-license.org)
