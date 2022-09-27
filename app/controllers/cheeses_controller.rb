class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses, methods: [:summary]
    render json: cheeses
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])

    # built-in serialization options
    # render json: cheese, only: [:id, :name, :price, :is_best_seller], methods: [:summary]

    #error messaging
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      # render json: { error: "Data not found"}, status: :404
      render json: { error: "Data not found"}, status: :not_found

    end
  end

end
