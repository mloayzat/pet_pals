require 'open-uri'

class ServicesController < ApplicationController
  def index
    @services = Service.all
 
   
  
  end

  def show

    @service = Service.find(params[:id])
    url_safe_street_address = URI.encode(@service.address)
    url = "http://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_street_address
    parsed_data = JSON.parse(open(url).read)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]


    @sum_of_ratings = Rating.where(:service_id => @service.id ).pluck(:average_rating).sum
    @count_of_ratings = Rating.where(:service_id => @service.id ).pluck(:average_rating).count
    
    if @count_of_ratings == 0 
      @avg = "??"

    else
      @avg_rating = (@sum_of_ratings / @count_of_ratings).to_f
      @avg = @avg_rating.round(1)
   end

  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new
    @service.image = params[:image]
    @service.category = params[:category]
    @service.name = params[:name]
    @service.address = params[:address]
    @service.phone = params[:phone]
    @service.description = params[:description]
    @service.user_id = params[:user_id]

    if @service.save
      redirect_to "/services", :notice => "Service created successfully."
    else
      render 'new'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])

    @service.image = params[:image]
    @service.category = params[:category]
    @service.name = params[:name]
    @service.address = params[:address]
    @service.phone = params[:phone]
    @service.description = params[:description]
    @service.user_id = params[:user_id]

    if @service.save
      redirect_to "/services", :notice => "Service updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @service = Service.find(params[:id])

    @service.destroy

    redirect_to "/services", :notice => "Service deleted."
  end

  def veterinary

    @services = Service.where(:category => 'Veterinary')

  end

  def groom

    @services = Service.where(:category => 'Grooming Services')

  end

def stores

    @services = Service.where(:category => 'Pet Stores')

  end

def sitter

    @services = Service.where(:category => 'Pet Sitter/Walker')

  end

def shelter

    @services = Service.where(:category => 'Pet Shelters')

  end

def hotels

    @services = Service.where(:category => 'Pet Hotels')

  end

def trainers

    @services = Service.where(:category => 'Pet Trainers')

  end


end
