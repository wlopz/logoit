class CreateCompanyInfos < ActiveRecord::Migration
  def change
    create_table :company_infos do |t|
      t.string :company_name
      t.string :address
      t.string :website
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :company_infos, :company_name, unique: true
  end
end
