require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  @today = Date.today
  @camp_start = Date.parse('20090515')
  @days_until_camp = @camp_start.yday - @today.yday
  haml :index
end

