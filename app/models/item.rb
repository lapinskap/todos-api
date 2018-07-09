class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Item < ApplicationRecord

  # model association
  belongs_to :todo

  # validation
  validates_presence_of :name
end