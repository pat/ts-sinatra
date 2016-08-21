require 'bundler'

Bundler.require :default, :development

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :database => 'ts_sinatra'
)

class Article < ActiveRecord::Base
  after_save ThinkingSphinx::RealTime.callback_for(:article)
end

framework = ThinkingSphinx::Frameworks::Plain.new
framework.environment = Sinatra::Application.environment.to_s
framework.root        = Dir.pwd
ThinkingSphinx::Configuration.instance.framework = framework

get '/hi' do
  Article.search.to_a.inspect
end
