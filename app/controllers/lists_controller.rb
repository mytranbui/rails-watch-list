class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/:id
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST "lists"
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE "lists/:id"
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to list_path(@list.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
