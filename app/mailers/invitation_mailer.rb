class InvitationMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def invitation_to_signup(invitation)
    agency = Agency.find_by_id(invitation.agency_id)
    @url  = "http://www.#{agency.hostname}/signup?u=#{invitation.hash}"
    mail(:to => invitation.email, :subject => t('email.invitation_to_signup.subject'))
  end
end
