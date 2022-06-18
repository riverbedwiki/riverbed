class Proposition < ApplicationRecord
  has_many :dependencies

  validates_presence_of :title
end
