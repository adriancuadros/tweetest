class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.string :body
      t.integer :dude_id

      t.timestamps
    end
  end
end
