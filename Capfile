# Only needed in development
$LOAD_PATH.unshift File.dirname(__FILE__) + '/lib'
require 'capistrano/log_with_awesome'

# Load the example
Dir['examples/*.rb'].each { |plugin| load(plugin) }

# Stub deploy tasks to demonstrate the awesome
server 'localhost', :local
set :application, 'test'
set :deploy_to, '/tmp'
task :deploy do
  run "uname -a"
end