class ChangeLocationsTweeterIdToTweetId < ActiveRecord::Migration
  def up
    remove_column :locations, :tweeter_id
    add_column :locations, :tweet_id, :integer
  end

  def down
    remove_column :locations, :tweet_id
    add_column :locations, :tweeter_id, :integer
  end
end
