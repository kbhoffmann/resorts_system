class ResortPassHoldersController < ApplicationController

  def index
    @resort = Resort.find(params[:resort_id])
    if params[:sort]
      @pass_holders = @resort.pass_holders.sort_name_alphabetically
    elsif params[:min_age]
      @pass_holders = @resort.pass_holders.minimum_age(params[:min_age])
    else
      @pass_holders = @resort.pass_holders
    end
  end

  def new
    @resort = Resort.find(params[:resort_id])
  end

  def create
    resort = Resort.find(params[:resort_id])

    resort.pass_holders.create!(resort_pass_holder_params)

    redirect_to "/resorts/#{resort.id}/pass_holders"
  end

  private

  def resort_pass_holder_params
    params.permit(:name, :age, :level, :season_pass, :resort_id)
  end

end
