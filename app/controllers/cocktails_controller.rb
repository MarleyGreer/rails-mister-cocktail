class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def home; end

  def index
    if params[:query]
      @cocktails = Cocktail.where("name LIKE '%#{params[:query].upcase}%'")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.name = @cocktail.name.upcase
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else render :new
    end

    @cocktails = Cocktail.all
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, photos: [])
  end
end
