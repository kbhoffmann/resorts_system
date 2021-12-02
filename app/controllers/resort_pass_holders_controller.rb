class ResortPassHoldersController < ApplicationController

  def index
    @resort = Resort.find(params[:resort_id])
    @pass_holders = @resort.pass_holders
  end

end