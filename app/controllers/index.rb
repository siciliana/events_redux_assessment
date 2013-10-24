get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/logout' do
  session.clear
  redirect "/"
end

post '/signin' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect "/events"
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error_signin = "Invalid email or password."
    erb :index
  end
end

post '/signup' do
  # sign-up
  @user = User.new(params[:user])
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/events'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    @error_signup = "Invalid email or password."
    erb :index
  end
end
