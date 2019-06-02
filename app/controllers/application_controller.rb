class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    Rails.logger.debug("RESOURCE---->#{resource}")
    case resource.type
    when "SuperUser"    #compare to 1
      index_questions_path
    when "BrandAdmin"    #compare to 2
      benchmarks_index_path
    when "CarExpert"    #compare to 2
      benchmarks_index_path
    when "BrandAdmin"    #compare to 2
      benchmarks_index_path
    else
      benchmarks_index_path
    end
  end
end
