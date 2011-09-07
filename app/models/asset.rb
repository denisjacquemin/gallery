class Asset < ActiveRecord::Base
  belongs_to :item
  has_attached_file :asset, :styles => { :large => "640>x480", :medium => "100>x100", :thumb => "50>x50" }
end
