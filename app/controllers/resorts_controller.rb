class ResortsController < ApplicationController
  def index
    @resorts = Resort.ordered_by_created_at
  end

  def new
  end

  def create
    resort = Resort.create(resort_params)

    redirect_to "/resorts"
  end

  def edit
    @resort = Resort.find(params[:id])
  end

  def update
    resort = Resort.find(params[:id])

    resort.update(resort_params)

    redirect_to "/resorts/#{resort.id}"
  end

  def show
    @resort = Resort.find(params[:id])
    @pass_holders_count = @resort.pass_holders.count
  end

  def destroy
    resort = Resort.find(params[:id])
    resort.destroy
    redirect_to "/resorts"
  end

  private

  def resort_params
    params.permit(:name, :city, :runs, :ski_only)
  end
end
