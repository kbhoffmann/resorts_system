class PassHoldersController < ApplicationController

  def index
    @pass_holders = PassHolder.all
  end

  def show
    @pass_holder = PassHolder.find(params[:id])
  end

end