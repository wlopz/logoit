class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :url
      t.string :uuid

      t.timestamps null: false
    end
  end
end
