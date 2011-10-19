class AddPrivacyToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :private, :boolean
  end
end
