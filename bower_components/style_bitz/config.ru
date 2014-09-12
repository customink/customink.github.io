ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)
require ::File.expand_path('../test/dummy_app/init',  __FILE__)
run Dummy::Application
