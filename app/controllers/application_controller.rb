class ApplicationController < ActionController::Base
  protect_from_forgery

  #We don't want to render the layout if PJAX is working
    def render(options = nil, extra_options = {}, &block)
      if request.headers['X-PJAX'] == 'true'
        options = {} if options.nil?
        options[:layout] = false 
      end
      super(options, extra_options, &block)
    end

  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def is_logged_in?
    !current_user.nil?
  end
  
  def login_required
    puts current_user.inspect    
    if current_user.nil? and !['sessions', 'users'].include? controller_name
      redirect_to login_path
    end
  end
  
  helper_method :current_user, :is_logged_in?
end
