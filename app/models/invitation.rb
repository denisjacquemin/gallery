class Invitation < ActiveRecord::Base
  # add email validation for :email field 
  belongs_to :agency
end
