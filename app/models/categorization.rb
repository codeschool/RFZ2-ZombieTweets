class Categorization < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :category
end
