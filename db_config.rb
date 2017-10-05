require 'active_record'


options = {
  adapter: 'postgresql',
  database: 'leftovrs'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] ||options)