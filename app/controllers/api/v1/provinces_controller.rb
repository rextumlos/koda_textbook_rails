class Api::V1::ProvincesController < ApplicationController
  def index
    region = Address::Region.find_by_id(params[:region_id])
    provinces = if region
                  region.provinces
                else
                  Address::Province.includes(:region).all
                end
    render json: provinces, each_serializer: ProvinceSerializer
  end

  def show
    province = Address::Province.find_by_id(params[:id])
    render json: province, serializer: ProvinceSerializer
  end
end
