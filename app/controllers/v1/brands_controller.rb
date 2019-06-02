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
