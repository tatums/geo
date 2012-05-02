class LocationsController < ApplicationController


  def index

    if Geocoder.search(params[:address]).empty?
      location = Geocoder.search('Chicago').first
      flash[:notice]=  'Task was successfully created.'
    else
      location = Geocoder.search(params[:address]).first
      flash[:notice] = "Sorry we couldn't find that location"
    end
    #@services = Service.near(location,20).page(params[:page])

    session[:coordinates] = location.coordinates
    gon.longitude = session[:coordinates].last if session[:coordinates]
    gon.latitude = session[:coordinates].first if session[:coordinates]

    gon.markers = Service.all.map{|s| s.coordinates.reverse}.uniq
    respond_to do |format|
      format.html
    end
  end

  def new
  end

end
