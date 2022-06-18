class Dependency < ApplicationRecord
  belongs_to :proposition
  has_many :candidate_relations
  has_many :candidates, through: :candidate_relations, source: :proposition
end
