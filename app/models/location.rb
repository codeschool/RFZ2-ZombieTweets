class Location < ActiveRecord::Base
  belongs_to :tweet, :dependent => :destroy
end
