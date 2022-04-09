class SlidersController < ApplicationController
  layout 'user'
  before_action :set_slider, only: %i[ show edit update destroy ]

  # GET /sliders or /sliders.json
  def index
    @sliders = Slider.all
  end

  # GET /sliders/1 or /sliders/1.json
  def show
  end

  # GET /sliders/new
  def new
    @slider = Slider.new
  end

  # GET /sliders/1/edit
  def edit
  end

  # POST /sliders or /sliders.json
  def create
    @slider = Slider.new(slider_params)

    respond_to do |format|
      if @slider.save
        format.html { redirect_to @slider, notice: "Slider was successfully created." }
        format.json { render :show, status: :created, location: @slider }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sliders/1 or /sliders/1.json
  def update
    respond_to do |format|
      if @slider.update(slider_params)
        format.html { redirect_to @slider, notice: "Slider was successfully updated." }
        format.json { render :show, status: :ok, location: @slider }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sliders/1 or /sliders/1.json
  def destroy
    @slider.destroy
    respond_to do |format|
      format.html { redirect_to sliders_url, notice: "Slider was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider
      @slider = Slider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def slider_params
      params.require(:slider).permit(:name, :image)
    end
end
