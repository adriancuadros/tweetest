class CreateDudes < ActiveRecord::Migration
  def change
    create_table :dudes do |t|
      t.string :username
      t.integer :company_id

      t.timestamps
    end
  end
end
