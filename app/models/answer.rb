class Answer < ApplicationRecord
  belongs_to :reference, polymorphic: true

  validates_presence_of :reference
end
