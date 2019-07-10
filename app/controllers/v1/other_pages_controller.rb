class V1::OtherPagesController < ApplicationController
  def home
    if current_user.nil?
      redirect_to search_path
    else
      case current_user.type
      when "SuperUser"    #compare to 1
        redirect_to concessionaires_index_path
      when "ConcessionaireAdmin"    #compare to 2
        redirect_to concessionaire_admin_home_path
      when "CarExpert"    #compare to 2
        redirect_to car_inspections_index_path
      when "Dispatcher"    #compare to 2
        redirect_to car_processes_index_path
      else
        redirect_to search_path
      end
    end

  end
end
