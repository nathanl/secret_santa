require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'erb'
require 'yaml'
require 'securerandom'
require_relative 'secret_santa/person'
require_relative 'secret_santa/email'
require_relative 'secret_santa/santa_logger'
Dotenv.load
