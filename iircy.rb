require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  @now = Time.now.utc
  @camp_start = Time.utc(2009, 5, 15, 15, 0, 0)
  @days_until_camp = ((@camp_start - @now) / (3600 * 24)).to_i
  haml :index
end

