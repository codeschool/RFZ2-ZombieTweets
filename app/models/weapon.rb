class Weapon < ActiveRecord::Base
  has_and_belongs_to_many :zombies
  before_save :check_ammo

  CONDITIONS = ["New", "Rusty", "Broken"]

  def toggle_condition
    c_index = CONDITIONS.find_index(self.condition)
    self.condition = CONDITIONS[c_index - 1] 
    self.save
  end

  private
  def check_ammo 
    if ammo == 3
      WeaponMailer.low_ammo(@user).deliver 
    end
  end
end
