class LocationsController < ApplicationController

  # def search_for_location
  #   location = Geocoder.search(params[:address]).first
  #   if location
  #     session[:coordinates] = location.coordinates
  #   end
  #   @services = Service.near(session[:coordinates],20).page(params[:page])
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def index
    if params[:address].blank?
      location = Geocoder.search('Chicago').first
    else
      location = Geocoder.search(params[:address]).first
    end
    session[:coordinates] = location.coordinates
    gon.longitude = session[:coordinates].last if session[:coordinates]
    gon.latitude = session[:coordinates].first if session[:coordinates]
    respond_to do |format|
      format.html
    end
  end

  def new
  end

end
