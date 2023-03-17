class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /properties or /properties.json
  def index
    @properties = Property.where(verfied: true)
  end

  # GET /properties/1 or /properties/1.json
  def show; end

  def search
    @properties = Property.where(property_type: params[:search]).or(Property.where(city: params[:search])).and(Property.where(verfied: true))
  end

  def check_user
    return unless current_user.role == 'buyer' || current_user.role == 'admin'

    redirect_to properties_path
  end

  def flat
    @flat = Property.flat
  end

  def show_property
    check_user
    @properties = Property.where(user_id: current_user.id)
  end

  def destroy_property
    params['id'] = params[:id].to_i
    if params[:id].nil?
      redirect_to reproperties_view_action_path
    else
      @property = Property.find(params[:id])
      if @property.destroy
        @cart = Cart.where(property_id: params[:id])
        if @cart.nil?
          redirect_to properties_view_action_path
        else
          @cart.destroy_all
          redirect_to properties_view_action_path
        end
      end
    end
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  def property_verfied
    if current_user.role == 'admin'
      @properties = Property.where(verfied: false)
    else
      redirect_to properties_path
    end
  end

  def verfied
    params['id'] = params[:id].to_i
    @properties = Property.find(params[:id])
    @properties.verfied = true
    return unless @properties.save

    render plain: 'verfied'
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.fetch(:property, {}).permit(:description, :price, :property_type, :location, :image, :city, :address,
                                       :user_id)
  end
end
