class VenuesController < ApplicationController

require "open-uri"

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])
    
    @list_item = ListItem.find_by_id(params[:list_item_id]) if params[:list_item_id].present?
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
        
    
    @venue = Venue.find_by_foursquareid(params[:foursquareid])
    
    
    if @venue.present?
      
      list_item = ListItem.new
      list_item.venue_id = @venue.id
      list_item.list_id = params[:list_id]
      list_item.save
      
      respond_to do |format|
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render json: @venue, status: :created, location: @venue }
      end
    
    else
      @venue = Venue.new
      @venue.name = params[:name]
      @venue.foursquareid = params[:foursquareid]
      @venue.latitude = params[:lat]
      @venue.longitude = params[:lng]
      @venue.address = params[:address]
      @venue.city = params[:city]
      
        if @venue.save

          list_item = ListItem.new
          list_item.venue_id = @venue.id
          list_item.list_id = params[:list_id]
          list_item.save
          
          respond_to do |format|
            format.html { redirect_to list_item.list, notice: 'Venue added.' }
            format.json { render json: @venue, status: :created, location: @venue }
          end
          
        else
          format.html { render action: "new" }
          format.json { render json: @venue.errors, status: :unprocessable_entity }
        end
      end 
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end
  
  def search
    
    query = params[:q].gsub(" ","%20")
    lat = params[:lat]
    long = params[:lng]
    @list_id = params[:list_id]
    
    json_venue_results = open("https://api.foursquare.com/v2/venues/suggestcompletion?query=#{query}&ll=#{lat},#{long}&client_id=WD42BVIP2QOPMWZLKANCX5U4CKNRFT03Z3M2NG4KDGXGWZQ3&client_secret=S3UAZIL2AX034UTUKN55LKUKCHAE3WTHRTB40UQRLNUSEYMO").read
    
    
    @venue_results = JSON.parse(json_venue_results)["response"]["minivenues"]
    
    # render text: @venue_results
    # redirect_to list_items_path
  end
  
  def select
    # @venue = Venue.new
    # @venue.name = params[:name]
    # @venue.foursquareid = params[:foursquareid]
    # @venue.latitude = params[:lat]
    # @venue.longitude = params[:long]
    # @venue.address = params[:address]
    # @venue.city = params[:city]
  end
  
  def all_venues
    @venues = Venue.all
  end
  
end
