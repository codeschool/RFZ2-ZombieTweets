class Tweet < ActiveRecord::Base
  belongs_to :zombie
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_one :location

  before_save :check_location
  before_save :set_show_location

  after_update {|tweet| logger.info "Tweet #{tweet.id} updated" }
  after_destroy {|tweet| logger.info "Tweet #{tweet.id} deleted" }

  scope :recent, order('created_at desc').limit(4)
  scope :graveyard, where(show_location: true, location: {name:'graveyard'})

  validates :message, presence: true

  accepts_nested_attributes_for :location

  private

  def check_location 
    if self.location
      self.show_location = true
    end
  end

  def set_show_location 
    self.show_location = location
  end
end
