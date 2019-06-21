class V1::OtherPagesController < ApplicationController
  def home
    if current_user.nil?
      redirect_to search_path
    else
      case current_user.type
      when "SuperUser"    #compare to 1
        redirect_to brands_index_path
      when "BrandAdmin"    #compare to 2
        redirect_to brand_admin_home_path
      when "CarExpert"    #compare to 2
        redirect_to benchmarks_index_path
      when "Dispatcher"    #compare to 2
        redirect_to processes_index_path
      else
        redirect_to search_path
      end
    end

  end
end
