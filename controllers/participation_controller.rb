require_relative('../models/participation')

get '/participations' do
  
  @participations = Participation.all
  
  erb(:participation)
end