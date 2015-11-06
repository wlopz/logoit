class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = current_user.campaigns.build(campaign_params)
    create_api_item
    @campaign.uuid = @campaign_api.uuid_item
    respond_to do |format|
      if @campaign.save
        format.html { redirect_to campaign_path(@campaign), notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        ApiAction.new.update_campaign(@campaign.uuid,@campaign.name,@campaign.url)
        format.html { redirect_to dashboard_index_path, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    ApiAction.new.destroy_campaign(@campaign.uuid)
    Logo.where(campaign_id: @campaign).to_a.each do |logo|
      logo.destroy
    end
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def create_api_item 
      @campaign_api = ApiAction.new
      @campaign_api.create_campaign(@campaign.name,@campaign.url)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:url, :uuid, :name,:user_id, :id)
    end
end
