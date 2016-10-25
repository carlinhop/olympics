require_relative('../models/participation')

get '/participations' do
  @participations = Participation.all
  erb(:'participation/index')
end

get '/participations/new' do
  erb(:'participation/new')
end

post '/participations' do
  @participation = Participation.new(params)
  @participation.save
  redirect('/participations')
end

get '/participations/:id' do
  @participation = Participation.find(params['id'])
  erb(:'participation/show')
end

get '/participations/:id/edit' do
   @participation = Participation.find(params['id'])
  erb(:'participation/edit')
end