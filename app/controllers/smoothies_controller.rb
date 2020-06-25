class SmoothiesController < ApplicationController
  def index
    @smoothies = Smoothie.all
  end

  def show
    @smoothie = Smoothie.find(params[:id])
  end

  def new
    @smoothie = Smoothie.new
  end

  def create
    @smoothie = Smoothie.create(smoothie_params(:name))
    smoothie_params(:ingredients_field)[:ingredients_field].split("\r\n").each do |i|
      Ingredient.create(name: i, smoothie: @smoothie)
    end

    redirect_to smoothie_path(@smoothie)
  end

  def edit
  end

  def update
  end

  def smoothie_params(*args)
    params.require(:smoothie).permit(args)
  end
end
