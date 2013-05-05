class Option < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :value

  attr_accessible :value
end
