require_relative('../models/athlete')

get '/athletes' do
  @athletes = Athlete.all
  erb(:'athlete/index')
end

get '/athletes/new' do
  erb(:'athlete/new')
end


post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save
  redirect('/athletes')
end

get '/athletes/:id' do
  @athlete = Athlete.find(params['id'])
  erb(:'athlete/edit')
end


get '/athletes/:id/edit' do
   @athlete = Athlete.find(params['id'])
  erb(:'athlete/edit')
end

put '/athletes/:id' do
   @athlete = Athlete.find(params['id'])
   @athlete.update(params)
   redirect('/athletes')
end

delete '/athletes/:id' do
   Athlete.destroy(params['id'])
   redirect('/athletes')
end
