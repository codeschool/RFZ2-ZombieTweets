class Tweet < ActiveRecord::Base
  belongs_to :zombie
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_one :location, :foreign_key => :tweeter_id

  before_save :check_location
  before_save :set_show_location

  after_update {|tweet| logger.info "Tweet #{tweet.id} updated" }
  after_destroy {|tweet| logger.info "Tweet #{tweet.id} deleted" }

  scope :recent, order('created_at desc').limit(4)
  scope :graveyard, where(show_location: true, location: 'graveyard')

  validates :message, presence: true

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
