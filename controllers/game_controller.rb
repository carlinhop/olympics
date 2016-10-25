get '/rankings' do
  
  @game = Game.find(1)
  
  erb(:game)
end
