class Api::v1::PersonTypesController < ApplicationController
  before_action :set_person_type, only: [:show, :update, :destroy]

  # GET /person_types
  def index
    @person_types = PersonType.all

    render json: @person_types
  end

  # GET /person_types/1
  def show
    render json: @person_type
  end

  # POST /person_types
  def create
    @person_type = PersonType.new(person_type_params)

    if @person_type.save
      render json: @person_type, status: :created, location: @person_type
    else
      render json: @person_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /person_types/1
  def update
    if @person_type.update(person_type_params)
      render json: @person_type
    else
      render json: @person_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /person_types/1
  def destroy
    @person_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_type
      @person_type = PersonType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_type_params
      params.require(:person_type).permit(:name)
    end
end
