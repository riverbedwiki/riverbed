class Argument < ApplicationRecord
  belongs_to :subject, polymorphic: true

  enum type: {support: 0, attack: 1}
  self.inheritance_column = nil
end
