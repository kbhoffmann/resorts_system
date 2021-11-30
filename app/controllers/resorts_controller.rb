class ResortsController < ApplicationController
  def index
    @resorts = ['Resort 1', 'Resort 2', 'Resort 3']
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
end
