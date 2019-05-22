class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        Rails.logger.debug("RESOURCE---->#{resource}")
        benchmarks_index_path    
    end
end
