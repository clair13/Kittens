class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten has been created"
      redirect_to kitten_url(@kitten)
    else
      flash.now[:errors] = @kitten.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @kitten.update_attributes(params[:kitten])
      flash[:success] = "Kitten was successfully updated"
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "Kitten has been deleted."
  end

  private
  
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end
end
