get '/ranking' do

  @game = Game.find(1)
  
  erb(:ranking)
end
