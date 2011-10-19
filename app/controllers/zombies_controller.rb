class ZombiesController < ApplicationController
  respond_to :html

  def index
    @zombies = Zombie.all  
  end

  def new
    @zombie = Zombie.new
  end

  def create
    @zombie = Zombie.new(params[:zombie])
    @zombie.save
    respond_with @zombie
  end

  def show
    @zombie = Zombie.find(params[:id])
  end
end
