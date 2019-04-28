class VisitItemsController < ApplicationController
  before_action :set_visit_item, only: [:show, :update, :destroy]

  # GET /visit_items
  def index
    @visit_items = VisitItem.all

    render json: @visit_items
  end

  # GET /visit_items/1
  def show
    render json: @visit_item
  end

  # POST /visit_items
  def create
    @visit_item = VisitItem.new(visit_item_params)

    if @visit_item.save
      render json: @visit_item, status: :created, location: @visit_item
    else
      render json: @visit_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visit_items/1
  def update
    if @visit_item.update(visit_item_params)
      render json: @visit_item
    else
      render json: @visit_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visit_items/1
  def destroy
    @visit_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit_item
      @visit_item = VisitItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def visit_item_params
      params.fetch(:visit_item, {})
    end
end
