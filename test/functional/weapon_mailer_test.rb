require 'test_helper'

class WeaponMailerTest < ActionMailer::TestCase
  test "low_ammo" do
    mail = WeaponMailer.low_ammo
    assert_equal "Low ammo", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "broken" do
    mail = WeaponMailer.broken
    assert_equal "Broken", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
