class LogosController < ApplicationController
  before_action :set_logo, only: [:show, :edit, :update, :destroy]
  before_action :set_campaign, only: [:new, :create]

  # GET /logos
  # GET /logos.json
  def index
    @logos = Logo.all
  end

  # GET /logos/1
  # GET /logos/1.json
  def show
  end

  # GET /logos/new
  def new
    @logo = Logo.new
  end

  # GET /logos/1/edit
  def edit
  end

  # POST /logos
  # POST /logos.json
  def create
    @logo = @campaign.logos.new(logo_params)
    @logo.name = "#{current_user.company_info.company_name} - #{Time.now.to_i}"
    filename = params[:logo][:image].tempfile.path
    create_api_image
    @api_image.create_image(@campaign.uuid,filename)
    @logo.uuid_image = @api_image.uuid_image
    respond_to do |format|
      if @logo.save
        format.html { redirect_to dashboard_index_path}
        format.json { render :show, status: :created, location: @logo }
      else
        format.html { render :new }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logos/1
  # PATCH/PUT /logos/1.json
  def update
    respond_to do |format|
      if @logo.update(logo_params)
        format.html { redirect_to campaign_path(@campaign)}
        format.json { render :show, status: :ok, location: @logo }
      else
        format.html { render :edit }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logos/1
  # DELETE /logos/1.json
  def destroy
    ApiAction.new.destroy_image(@logo.uuid_image)
    @logo.destroy
    respond_to do |format|
      format.html { redirect_to campaign_path(@logo.campaign), notice: 'Logo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logo
      @logo = Logo.find(params[:id])
    end

    def create_api_image
      @api_image = ApiAction.new
    end
    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logo_params
      params.require(:logo).permit(:image, :campaign_id, :user_id)
    end
end
