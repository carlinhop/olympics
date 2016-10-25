require_relative('../models/sport')

get '/sports' do
  @sports = Sport.all  
  erb(:'sport/index')
end

get '/sports/new' do
  erb(:'sport/new')
end

post '/sports' do
  @sport = Sport.new(params)
  @sport.save
  redirect('/sports')
end

get '/sports/:id' do
  @sport = Sport.find(params['id'])
  erb(:'sport/show')
end

get '/sports/:id/edit' do
   @sport = Sport.find(params['id'])
  erb(:'sport/edit')
end

put '/sports/:id' do
   @sport = Sport.find(params['id'])
   @sport.update(params)
   redirect('/sports')
end

delete '/sports/:id' do
   Sport.destroy(params['id'])
   redirect('/sports')
end