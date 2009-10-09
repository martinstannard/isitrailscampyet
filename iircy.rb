require 'rubygems'
require 'sinatra'
require 'haml'

helpers do

  def days_until_camp
    now = Time.now.utc
    camp_start = Time.utc(2009, 11, 20, 15, 0, 0)
    ((camp_start - now) / (3600 * 24)).to_i
  end
  
end

get '/' do
  @days = days_until_camp
  case 
  when @days > 0
    @big = 'NO'
    @small = "only #{@days} sleep#{@days > 1 ? 's' : ''} to go... better get a <a href=\"http://rails-camp.eventwax.com/rails-camp-6/register\">ticket!</a>"
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
  haml :index, :options => {:format => :html5,
                            :attr_wrapper => '"'}
end

get '/format=xml' do
  @days = days_until_camp
  builder do |xml|
    xml.isitrailscampyet((@days > 0 || @days < -4) ? "no" : "yes")
  end
end

__END__
  
@@ index
%div
  %h1= @big
  %p= @small

@@ layout
!!!
%html{:lang => "en-au"}
  %head
    %meta{:charset =>"UTF-8"}
    %title Is it Railscamp Yet?
    %style{:type => "text/css", :media => "screen"}
      div {font: 700 1em helvetica,"helvetica neue", arial, sans-serif; margin: 0; padding: 220px 0 0 0; text-align: center;}
      h1 {font-size: 160px; padding: 0;margin: 0;}
  %body
    = yield
