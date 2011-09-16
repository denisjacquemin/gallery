class Agency < ActiveRecord::Base
  
  has_many :users
  has_many :invitations
  
  validates_presence_of :name
  
end
