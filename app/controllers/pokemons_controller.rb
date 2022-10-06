class PokemonsController < ApplicationController
  POKEMON_PER_PAGE = 20

  def index
    @per_page = params.fetch(:per_page, POKEMON_PER_PAGE).to_i
    @page = params.fetch(:page, 1).to_i

    if @page < 1
      @page = 1
    end

    offset = (@page - 1) * @per_page
    @pokemons = Pokemon.offset(offset).limit(@per_page);
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    puts @pokemon

    if @pokemon.save
      redirect_to @pokemon
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(pokemon_params)
      redirect_to @pokemon
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy

    redirect_to root_path, status: :see_other
  end

  def pokemon_params
    params.require(:pokemon).permit(:number, :name, :type1, :type2, :total,
      :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
  end
end
