 class Zombie < ActiveRecord::Base
  has_many :tweets
  has_and_belongs_to_many :weapons

  def as_json(options)
    super(options || {only: [:name, :ammo], include: :weapons})
  end
end
