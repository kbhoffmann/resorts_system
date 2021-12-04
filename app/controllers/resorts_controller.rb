class ResortsController < ApplicationController
  def index
    @resorts = Resort.ordered_by_created_at
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
    @pass_holders = @resort.pass_holders
    @pass_holder_count = @pass_holders.count
  end
end
