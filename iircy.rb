require 'rubygems'
require 'sinatra'
require 'haml'

helpers do

  def days_until_camp
    now = Time.now.utc
    camp_start = Time.utc(2009, 5, 15, 15, 0, 0)
    ((camp_start - now) / (3600 * 24)).to_i
  end
  
end

get '/' do
  @days = days_until_camp
  case 
  when @days > 0
    @big = 'NO'
    @small = "only #{@days} sleep#{@days > 1 ? 's' : ''} to go..."
  when @days == 0
    @big = 'YES'
    @small = 'Railscamp starts today!'
  when @days > -4
    @big = 'YES'
    @small = "Railscamp is rockin'!"
  else
    @big = 'NO'
    @small = 'Railscamp is over :('
  end
  haml :index
end

get '/format=xml' do
  @days = days_until_camp
  builder do |xml|
    xml.isitrailscampyet ((@days > 0 || @days < -4) ? "no" : "yes")
  end
end

__END__
  
@@ index
%div{:style => "text-align: center; font-weight: bold; font-family: arial;text-align: center; padding-top: 200px;"}
  %div{:style => "font-size: 120pt;"}
    = @big
  %h4= @small
