class AddCampaignToLogos < ActiveRecord::Migration
  def change
    add_reference :logos, :campaign, index: true, foreign_key: true
  end
end
