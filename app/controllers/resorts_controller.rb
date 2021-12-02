class ResortsController < ApplicationController
  def index
    @resorts = Resort.all
  end

  def new
  end

  def create
    resort = Resort.new({
      name: params[:resort][:name],
      city: params[:resort][:city]
      })
      resort.save

      redirect_to '/resorts'
  end

  def show
    @resort = Resort.find(params[:id])
  end

  
end
