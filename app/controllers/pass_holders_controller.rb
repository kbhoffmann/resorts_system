class PassHoldersController < ApplicationController

  def index
    @pass_holders = PassHolder.where(season_pass: true)
  end

  def show
    @pass_holder = PassHolder.find(params[:id])
  end

  def edit
    @pass_holder = PassHolder.find(params[:id])
  end

  def update
    pass_holder = PassHolder.find(params[:id])
    pass_holder.update(name: params[:name],
                   age: params[:age],
                   level: params[:level],
                   season_pass: params[:season_pass]
                  )
    redirect_to "/pass_holders/#{pass_holder.id}"
  end

end
