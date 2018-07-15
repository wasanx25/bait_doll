def erb(template)
  ERB.new(File.read(File.expand_path("../#{template}", __FILE__))).result(binding)
end

gsub_file 'Gemfile', /^gem\s+["']sqlite3["'].*$/, ''
gsub_file 'Gemfile', /^gem\s+["']turbolinks["'].*$/, ''

gem_group :development, :test do
  gem 'rubocop', require: false
  gem 'rails_best_practices', require: false
  gem 'brakeman', require: false
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'factory_girl_rails', require: false
end

file '.rubocop.yml', '.rubocop.yml'

run 'bundle install'
generate 'rspec:install'

file 'Dockerfile', erb('Dockerfile')
create_file 'docker-compose.yml', <<YAML
version: '2'
services:
  web:
    build:
      context: '.'
      args:
        app_name: '#{app_name}'
    command: ['bash', '-c', 'rm -f tmp/pids/server.pid; ./bin/rails server -b 0.0.0.0']
    ports:
      - '3000:3000'
    volumes:
      - '.:/var/www/#{app_name}'
YAML
