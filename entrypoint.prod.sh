#!/bin/bash
set -e

echo "rm -f /myapp/tmp/pids/server.pid"
rm -f /myapp/tmp/pids/server.pid

echo "bundle exec rake assets:precompile"
bundle exec rake assets:precompile

echo "bundle exec rake assets:clean"
bundle exec rake assets:clean

echo "bundle exec rake db:migrate"
bundle exec rake db:migrate

echo "bundle exec puma -p 8080 -e production -C config/puma.rb -d"
bundle exec puma -p 8080 -e production -C config/puma.rb -d
