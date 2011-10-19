class WeaponsController < ApplicationController
  def index
    @zombie = Zombie.find(params[:zombie_id]) 
    @weapons = @zombie.weapons
  end

  def show
    @zombie = Zombie.find(params[:zombie_id]) 
    @weapon = @zombie.weapons.find(params[:id])
    render json: @weapon.to_json(except: [:id, :created_at, :updated_at, :email], include: :zombie)
  end

  def create
    @weapon = Weapon.new(params[:post]) 
    if @weapon.save
      render json: @weapon, status: :created, location: @weapon 
    else
      render json: @weapon.errors, status: :unprocessable_entity 
    end
  end

  def fire_weapon
    @weapon = Weapon.find(params[:id]) 
    @weapon.fire!
    if @weapon.low_ammo?
      render :fire_and_reload 
    end
  end

  def reload
    @weapon = Weapon.find(params[:id]) respond_to do |format|
    if @weapon.ammo < 30
      @weapon.reload(params[:ammo_to_reload])
      format.json { render :json => @weapon.to_json(:only => :ammo), status: :ok } 
      format.html { redirect_to @weapon, notice: 'Weapon ammo reloaded' }
    else
      format.json { render :json => @weapon.to_json(:only => :ammo), status: :unprocessable_entity }
      format.html { redirect_to @weapon, notice: 'Weapon not reloaded' }
    end
    format.js
  end

  def toggle_condition
    @weapon = Weapon.find(params[:id]) 
    @weapon.toggle_condition 
    respond_to do |format|
      format.html { redirect_to @weapon, notice: 'Changed condition' }
      format.js 
    end
  end
end
