class ListingsController < ApplicationController

		before_action :authorize, except: [:show, :index]

  def index
    # city search function for the listings 
    if params[:search]
      @listings = Listing.where(:city => params[:search].downcase)
    else
      @listings = Listing.all
    end
  end

  def show
      @listing = Listing.find(params[:id])
      @user = User.find(@listing.user_id)
  end


  def create
      @listing = current_user.listings.new(listing_params)
      
      # getting the latitude & the longitude using geokit gem/Geocoder to request geocode of the address entered, used to display pin on map
      @listing.latitude = Geokit::Geocoders::GoogleGeocoder.geocode(@listing.full_address).latitude
      @listing.longitude = Geokit::Geocoders::GoogleGeocoder.geocode(@listing.full_address).longitude
      
      @listing[:city].downcase!

    if @listing.save
      flash[:success] = "Listing created!"
      redirect_to listings_path
    else
      flash[:danger] = "All Fields are Required"
      render :new
    end
  end

  def edit
      @listing = Listing.find(params[:id])
  end
  
  def update
      #saves update listing
      @listing = Listing.find(params[:id])
  
    if @listing.update(listing_params)
      redirect_to listing_path
    else
      render :edit
    end
  end
  
  def destroy
      @listing = Listing.find(params[:id])
     
      @listing.destroy
     
      redirect_to listings_path
  end

  private
  
  def listing_params
      params.require(:listing).permit(:type, :address, :city, :state, :zipcode, :num_bed, :num_bath, :price, :description, :available_date, :photo, :latitude, :longitude, :parking, :pets, :acheater, :privatebath, :wifi, :furnished)
  end
  
  end 
