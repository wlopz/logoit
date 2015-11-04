class AddNameToLogo < ActiveRecord::Migration
  def change
    add_column :logos, :name, :string
  end
end
