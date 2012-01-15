class ServicesController < ApplicationController

  def index
    @location = session[:latlng]
    @merchants = Merchant.near(@location.coordinates)
    
    @x_services = @merchants.collect {|m| m.services }

    pry
    if params[:category]
      @services = Service.where(:category => params[:category]).all(:include => :merchant)
    else
      @services = Service.all(:include => :merchant)
    end
    @merchants = @services.collect {|s| s.merchant}
    respond_to do |format|
      format.html # index.html.erb
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
  
end
