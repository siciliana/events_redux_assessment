get '/events' do
  redirect "/" unless current_user

  @created_events = current_user.created_events
  erb :list_events
end

get '/events/create' do
  erb :create_event
end

post '/events/create' do
  @event = Event.new(params[:event])
  @event.user_id = current_user.id

  if @event.save
    redirect '/events'
  else
    @error = "Something went wrong. Please try again later."
    erb :create_event
  end
end

post '/events/create/ajax' do
  @event = Event.new(params)
  @event.user_id = current_user.id
  @event.save
  response = "#{@event.name}, #{@event.location}, #{format_date(@event.starts_at)}, #{format_date(@event.ends_at)}"
end

post '/events/delete' do
  Event.find(params[:event_id]).destroy
  redirect '/events'
end

get '/events/edit' do
  @event = Event.find(params[:event_id])
  erb :edit_event
end

post '/events/edit' do
  @event = Event.find(params[:event_id])
  @event.update_attributes(params[:event])
  redirect '/events'
end

