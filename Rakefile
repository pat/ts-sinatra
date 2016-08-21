task :environment do
  Sinatra::Application.environment = 'production'
end

task :console => :environment do
  require 'irb'

  ARGV.clear
  IRB.start
end

require './app.rb'

require 'thinking_sphinx/tasks'

namespace :db do
  task :create => :environment do
    ActiveRecord::Base.establish_connection(
      :adapter  => 'postgresql',
      :database => 'postgres'
    )
    ActiveRecord::Base.connection.create_database 'ts_sinatra',
      :adapter  => 'postgresql',
      :database => 'ts_sinatra',
      :encoding => 'utf8'
    ActiveRecord::Base.establish_connection(
      :adapter  => 'postgresql',
      :database => 'ts_sinatra'
    )
  end

  task :migrate => :environment do
    ActiveRecord::Base.connection.create_table :articles do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
  end

  task :seeds => :environment do
    Article.create :title => 'Hello', :body => 'This is an article'
  end
end
