# MoviePicks
MoviePicks is Youtube Ranking Site

## Development
### Run app
```
docker-compose up -d
```

### Migration
```
docker-compose exec server bash -c "bundle exec rails db:migrate"
```

### RSpec
```
docker-compose exec server bash -c "bundle exec rspec"
```
