class Location < ActiveRecord::Base
  belongs_to :tweet, :foreign_key => :tweeter_id, :dependent => :destroy
end
