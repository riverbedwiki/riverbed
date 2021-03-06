class Perspective < ApplicationRecord
  has_many :acceptance_relations
  has_many :accepted_propositions, through: :acceptance_relations, source: :proposition

  validates_presence_of :title
end
