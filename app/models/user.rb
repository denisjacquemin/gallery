class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :agency_id
  
  belongs_to :agency
  
  has_secure_password
  validates_presence_of :email, :on => :create
  validates_presence_of :password, :on => :update
  
  scope :by_agency, lambda { |agency_id| where("agency_id = ?", agency_id)}
end
