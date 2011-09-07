class DashboardController < ApplicationController
  
  before_filter :login_required
  layout 'admin'
  
  
  def index
  end

end
