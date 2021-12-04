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
  end


  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent

end
