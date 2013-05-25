class Advertisement < ActiveRecord::Base
  attr_accessible :ad, :title
  has_attached_file :ad, :styles => {:medium => "400x400>"}
end
