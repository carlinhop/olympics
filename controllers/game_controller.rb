get '/ranking' do

  @game = Game.find(1)
  @game.country_ranking
  erb(:ranking)
end
