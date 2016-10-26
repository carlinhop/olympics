require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/game')

configure do
  set :game, Game.find(1) 
end

require_relative('./controllers/game_controller')
require_relative('./controllers/athlete_controller')
require_relative('./controllers/event_controller')
require_relative('./controllers/participation_controller')
require_relative('./controllers/country_controller')
require_relative('./controllers/sport_controller')