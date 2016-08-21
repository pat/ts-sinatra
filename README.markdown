A small Sinatra application with ActiveRecord and Thinking Sphinx integration. It uses real-time indices.

Commands to test:

1. `bundle install`
2. `rake db:create db:migrate db:seeds ts:regenerate console`
3. (In the console) `Article.search 'Hello'`
