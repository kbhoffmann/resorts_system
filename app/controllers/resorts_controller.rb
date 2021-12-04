class ResortsController < ApplicationController
  def index
    @resorts = Resort.ordered_by_created_at
  end

  def new
  end

  def create
    resort = Resort.create(name: params[:name],
                           city: params[:city],
                           runs: params[:runs],
                           ski_only: params[:ski_only]
                          )

    redirect_to "/resorts"
  end

  def show
    @resort = Resort.find(params[:id])
    @pass_holders_count = @resort.pass_holders.count
  end
end
