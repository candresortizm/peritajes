class V1::BrandsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    Brand.new(brand_params).save!
    redirect_to brands_index_path
  end

  def admin_home
    brand_users = User.where(brand_id:1,type:["CarExpert","Dispatcher"]).to_a
    @car_experts = brand_users.select{|user| user.type="CarExpert"}
    @dispatchers = brand_users.select{|user| user.type="Dispatcher"}
    @inspections = CarInspection.where(car_expert_id: @car_experts.map(&:id) )
  end

  def new_user

  end

  def update
    @all = CarInspection.all
  end

  def edit
    @all = CarInspection.all
  end

  private

  def brand_params
    params.require(:brand).permit(:name,:address,:telephone,:nit)
  end
end
