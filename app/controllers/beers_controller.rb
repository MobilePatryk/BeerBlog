class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.paginate(page: params[:page], per_page: 5)
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
  end

  # GET /beers/new
  def new
    @beer = Beer.new

  end

  # GET /beers/1/edit
  def edit
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(beer_params)
    @beer.user = current_user
    
    respond_to do |format|
      if @beer.save
        flash[:success] = "Beer was successfully added"
        format.html { redirect_to @beer }
        format.json { render :show, status: :created, location: @beer }
      else
        format.html { render :new }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    respond_to do |format|
      if @beer.update(beer_params)
        flash[:success] = "Beer was successfully updated"
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @beer }
      else
        format.html { render :edit }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer.destroy
    flash[:danger] = "Beer was successfully destroyed"
    respond_to do |format|
      format.html { redirect_to beers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = Beer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:name, :beer_type, :country, :price, category_ids: [])
    end

    def require_same_user
      if current_user != @beer.user
        flash[:danger] = "You can only edit or delete your own beer"
        redirect_to beers_path
      end
    end
end
