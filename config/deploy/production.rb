# config/deploy.rb or config/deploy/production.rb
set :rails_env, 'production'
set :puma_bind, 'tcp://0.0.0.0:3000'
