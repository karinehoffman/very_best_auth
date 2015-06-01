Class CountriesController < ApplicationController
  def index
    @countries = Trip.all
  end

  def show
    @country = Trip.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new
    @country.name = params[:name]

    if @country.save
      redirect_to "/countries/new", :notice => "Country created successfully."
    else
      render 'new'
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    @country.name = params[:name]

    if @country.save
      #should redirect to exact trip
      redirect_to "/trips", :notice => "Trip created successfully."
    else
      render 'edit'
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    redirect_to "/trips", :notice => "Trip deleted."
  end

end

