class AddFieldToLogo < ActiveRecord::Migration
  def change
    add_column :logos, :uuid_item, :string
    add_column :logos, :uuid_image, :string
  end
end
