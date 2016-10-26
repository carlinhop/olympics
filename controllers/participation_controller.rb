require_relative('../models/participation')
require_relative('../models/game')


@game = Game.find(1)

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

put '/participations/:id' do
   @participation = Participation.find(params['id'])
   @participation.update(params)
   redirect('/participations')
end

delete '/participations/:id' do
   Participation.destroy(params['id'])
   redirect('/participations')
end