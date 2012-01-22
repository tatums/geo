class ServicesController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  def index
    
    # if params[:category]
    #   @services = Service.where(:category => params[:category]).all(:include => :merchant)
    # else
    #   @services = Service.all(:include => :merchant)
    # end
    
    
    # if session[:coordinates]
    #    @services = Service.near(session[:coordinates],20).order(sort_column + " " + sort_direction).page(params[:page])
    # else 
    #    @services = Service.all.order(params[:order]).order(sort_column + " " + sort_direction).page(params[:page])
    # end
        
        
    if session[:coordinates]
       @services = Service.near(session[:coordinates],20).page(params[:page])
    else 
       @services = Service.all.order(params[:order]).page(params[:page])
    end
    
    @users = User.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.js
      #format.json { render json: @services }
    end
  end


  def show
    @service = Service.find(params[:id])
    @marker = @service.merchant.to_gmaps4rails
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end


  def new
    @merchant = Merchant.find(params[:merchant_id])
    @service = @merchant.services.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end


  def edit
    @service = Service.find(params[:id])
  end


  def create
    @merchant = Merchant.find(params[:merchant_id])
    @service = @merchant.services.new(params[:service])
    respond_to do |format|
      if @service.save
        format.html { redirect_to services_path, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @service = Service.find(params[:id])
    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :ok }
    end
  end
  
  def search_for_location
    location = Geocoder.search(params[:address]).first
    if location
      session[:coordinates] = location.coordinates
    end
    @services = Service.near(session[:coordinates],20).page(params[:page])
    respond_to do |format|
      format.js
    end            
  end  
  
  
  
  private


    
    def sort_column
      Service.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
# private  
#   def sort_column
#     Service.column_names.include?(params[:sort]) ? params[:sort] : "name"
#   end
# 
#   def sort_direction
#     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
#   end
  
end
