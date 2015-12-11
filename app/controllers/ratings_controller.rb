class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new
    @rating.average_rating = params[:average_rating]
    @rating.content = params[:content]
    @rating.service_id = params[:service_id]
    @rating.user_id = params[:user_id]

    if @rating.save
      redirect_to :back, :notice => "Rating created successfully."
    else
      render 'new'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    @service = Service.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])

    @rating.average_rating = params[:average_rating]
    @rating.content = params[:content]
    @rating.service_id = params[:service_id]
    @rating.user_id = params[:user_id]

    if @rating.save
      redirect_to "/services", :notice => "Rating updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])

    @rating.destroy

    redirect_to "/ratings", :notice => "Rating deleted."
  end
end
