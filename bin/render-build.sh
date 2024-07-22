#!/bin/sh
set -o errexit
set -o nounset
set -o pipefail

# Install gems
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Clean up old assets
bundle exec rake assets:clean

# Run database migrations
bundle exec rake db:migrate

# Optionally, you might want to clear old logs
# bundle exec rake log:clear
