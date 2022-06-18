class Dependency < ApplicationRecord
  belongs_to :proposition
  has_many :candidate_relations
  has_many :candidates, through: :candidate_relations, source: :proposition

  validates_presence_of :title
end
