class ResortPassHoldersController < ApplicationController

  def index
    @resort = Resort.find(params[:resort_id])
    @pass_holders = @resort.pass_holders
    if params[:sort]
      @pass_holders = @pass_holders.sort_name_alphabetically
    end
  end

  def new
    @resort = Resort.find(params[:resort_id])
  end

  def create
    resort = Resort.find(params[:resort_id])

    passholder = resort.pass_holders.create!(name: params[:name],
                                   age: params[:age],
                                   level: params[:level],
                                   season_pass: params[:season_pass],
                                   resort_id: params[:resort_id]
                                  )

    redirect_to "/resorts/#{resort.id}/resort_pass_holders"
  end

end
