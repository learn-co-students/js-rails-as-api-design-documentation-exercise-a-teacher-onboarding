class CoffeesController < ApplicationController

  def search
    page = (params[:page] || "1").to_i
    origin = (params[:origin] || "")
    pagination = 5
    index_start = (page - 1) * pagination
    coffees = Coffee.all
      .select{ |coffee| coffee.origin.downcase.include?(origin) }
      .slice(index_start, pagination)
      
    render json: coffees
  end
end
