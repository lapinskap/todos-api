class Item < ActiveRecord::Base

  # model association
  belongs_to :todo

  # validation
  validates_presence_of :name
end