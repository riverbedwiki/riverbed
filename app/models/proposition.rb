class Proposition < ApplicationRecord
  has_many :dependencies
  has_many :arguments, as: :subject

  validates_presence_of :title
end
