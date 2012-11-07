class AddLocationIdToTweets < ActiveRecord::Migration
  def up
    add_column :locations, :tweet_id, :integer
    add_index :locations, :tweet_id
  end

  def down
    remove_column :locations, :tweet_id
    remove_index :locations, :tweet_id
  end
end
