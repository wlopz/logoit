class AddFieldToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :name, :string
  end
end
