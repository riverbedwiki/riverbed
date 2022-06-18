class CandidateRelation < ApplicationRecord
  belongs_to :dependency
  belongs_to :proposition
end
