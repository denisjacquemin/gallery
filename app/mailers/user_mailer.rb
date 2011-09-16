class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def signup_agency_user(user, agency)
    @user = user
    @url  = "http://www.#{agency.hostname}/signup?u=#{user.hash}"
    mail(:to => user.email, :subject => t())
  end
end
