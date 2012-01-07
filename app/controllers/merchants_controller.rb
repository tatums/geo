class MerchantsController < ApplicationController
  before_filter :require_user
  
  def index
    @merchants = Merchant.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @merchants }
    end
  end

  def show
    @merchant = Merchant.find(params[:id])
    @json = @merchant.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @merchant }
    end
  end


  def new
    @merchant = Merchant.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @merchant }
    end
  end


  def edit
    @merchant = Merchant.find(params[:id])
  end


  def create
    @merchant = Merchant.new(params[:merchant])

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Merchant was successfully created.' }
        format.json { render json: @merchant, status: :created, location: @merchant }
      else
        format.html { render action: "new" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @merchant = Merchant.find(params[:id])

    respond_to do |format|
      if @merchant.update_attributes(params[:merchant])
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy

    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :ok }
    end
  end
end
