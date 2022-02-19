class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.text :action_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
