class Item < ActiveRecord::Base
  attr_accessible :name, :description, :assets_attributes
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
end
