class WeaponMailer < ActionMailer::Base
  default from: "admin@rfz.com"
  
  def low_ammo(weapon, zombie)
    attachments["weapon.jpg"] = weapon.picture_file
    mail to: zombie.email, subject: "#{weapon.name} has low ammo"
  end

  def broken
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
