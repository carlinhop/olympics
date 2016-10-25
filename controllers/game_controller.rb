get '/rankings' do
  @game = Game.new('name'=>"Rio", 'year'=> 2016)
  
  erb(:game)
end
