require_relative('../models/event')

get '/events' do
  @events = Event.all  
  erb(:'event/index')
end

get '/events/new' do
  erb(:'event/new')
end

post '/events' do
  @event = Event.new(params)
  @event.save
  redirect('/events')
end


get '/events/:id' do
  @event = Event.find(params['id'])
  erb(:'event/show')
end


get '/events/:id/edit' do
   @event = Event.find(params['id'])
  erb(:'event/edit')
end

put '/events/:id' do
   @event = Event.find(params['id'])
   @event.update(params)
   redirect('/events')
end

delete '/events/:id' do
   Event.destroy(params['id'])
   redirect('/events')
end