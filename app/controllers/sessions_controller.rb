class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
  def set_location
    location = Geocoder.search("#{params[:latitude].to_f}, #{params[:longitude].to_f}").first
    if location
      session[:coordinates] = location.coordinates
    end  
    respond_to do |format|
      format.js
    end        
  end
  
  def search_for_location
    location = Geocoder.search(params[:address]).first
    if location
      session[:coordinates] = location.coordinates
    end  
    respond_to do |format|
      format.js
    end            
  end  
  
  def find_me
    session[:coordinates] = nil
    respond_to do |format|
      format.js
    end        
  end  
  
  
end
