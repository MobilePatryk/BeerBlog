class BestBeersController < ApplicationController
  before_action :set_best_beer, only: [:show, :edit, :update, :destroy]

  # GET /best_beers
  # GET /best_beers.json
  def index
    @best_beers = BestBeer.all
  end

  # GET /best_beers/1
  # GET /best_beers/1.json
  def show
  end

  # GET /best_beers/new
  def new
    @best_beer = BestBeer.new
  end

  # GET /best_beers/1/edit
  def edit
  end

  # POST /best_beers
  # POST /best_beers.json
  def create
    @best_beer = BestBeer.new(best_beer_params)

    respond_to do |format|
      if @best_beer.save
        format.html { redirect_to @best_beer, notice: 'Best beer was successfully created.' }
        format.json { render :show, status: :created, location: @best_beer }
      else
        format.html { render :new }
        format.json { render json: @best_beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /best_beers/1
  # PATCH/PUT /best_beers/1.json
  def update
    respond_to do |format|
      if @best_beer.update(best_beer_params)
        format.html { redirect_to @best_beer, notice: 'Best beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @best_beer }
      else
        format.html { render :edit }
        format.json { render json: @best_beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /best_beers/1
  # DELETE /best_beers/1.json
  def destroy
    @best_beer.destroy
    respond_to do |format|
      format.html { redirect_to best_beers_url, notice: 'Best beer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_best_beer
      @best_beer = BestBeer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def best_beer_params
      params.require(:best_beer).permit(:beer, :alcohol, :points, :type)
    end
end
