class CreateWeaponZombieJoinTable < ActiveRecord::Migration
  def change
    # we need to disable the primary key with `id: false` on this table, 
    # it doesn't represent a model but serves as a join table to the 
    # has_and_belongs_to_many relationship between weapons and zombies.
    create_table :weapons_zombies, id: false do |t|
      t.integer :weapon_id
      t.integer :zombie_id
    end
  end
end
