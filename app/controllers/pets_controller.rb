class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pet, only: [:show, :new, :edit, :update, :destroy]
  before_action 'authorize_action_for @pet', except: [:index, :show, :new, :create]
  has_scope :has_location, default: true, type: :boolean
  has_scope :listing_type
  has_scope :missing_since
  has_scope :source
  has_scope :breed
  has_scope :animal
  has_scope :color
  has_scope :gender
  has_scope :page, default: 1
  has_scope :near

  def index
    @pets = apply_scopes(Pet).all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @pet = current_user.pets.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pet.attributes = pet_params
    authorize_action_for @pet
    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = params[:id] ? Pet.find(params[:id]) : Pet.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :color, :age, :weight, :markings, :gender, :collar, :collar_description, :chipped, :injured,
                                  :listing_type, :missing_since_found_at, :location, :latitude, :longitude, :description,
                                  :returned_to_owner, :scraping_script, :scraped_feed, :source_url, :breed_id, :user_id, :photo_url)
    end
end
