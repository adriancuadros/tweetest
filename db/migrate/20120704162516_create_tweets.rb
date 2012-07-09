class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.string :twitter_id
      t.integer :dude_id

      t.timestamps
    end
  end
end
