require_relative('../models/country')
require_relative('../models/game')


@game = Game.find(1)

get '/countries' do
  @game = Game.find(1)
  @countries = Country.all  
  erb(:'country/index')
end

get '/countries/new' do
  erb(:'country/new')
end

post '/countries' do
  @country = Country.new(params)
  @country.save
  redirect('/countries')
end

get '/countries/:id' do
  @country = Country.find(params['id'])
  erb(:'country/edit')
end

get '/countries/:id/edit' do
   @country = Country.find(params['id'])
  erb(:'country/edit')
end

put '/countries/:id' do
   @country = Country.find(params['id'])
   @country.update_with_hash(params)
   redirect('/countries')
end

delete '/countries/:id' do
   Country.destroy(params['id'])
   redirect('/countries')
end
