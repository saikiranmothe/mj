class Relation < ActiveRecord::Base
  attr_accessible :relationship, :priority
  has_many :family_members
  has_many :users, :through => :family_members
end
