require 'httparty'
require 'faker'
require 'rspec'

CONFIG = YAML.load_file('./config/homolog.yml')

$param_messages  = YAML.load_file('./config/messages.yml')