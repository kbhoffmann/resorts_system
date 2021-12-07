class PassHoldersController < ApplicationController

  def index
    @pass_holders = PassHolder.true_only
  end

  def show
    @pass_holder = PassHolder.find(params[:id])
  end

  def edit
    @pass_holder = PassHolder.find(params[:id])
  end

  def update
    pass_holder = PassHolder.find(params[:id])
    pass_holder.update(pass_holder_params)
    redirect_to "/pass_holders/#{pass_holder.id}"
  end

  def destroy
    pass_holder = PassHolder.find(params[:id])
    pass_holder.destroy
    redirect_to '/pass_holders'
  end

  private

  def pass_holder_params
    params.permit(:name, :age, :level, :season_pass)
  end
end
