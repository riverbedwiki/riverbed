class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :theory
end
