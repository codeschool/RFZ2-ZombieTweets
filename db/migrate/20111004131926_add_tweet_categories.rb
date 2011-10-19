class AddTweetCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name 
    end

    create_table :categorizations do |t|
      t.integer :tweet_id
      t.integer :category_id
    end 
  end
end