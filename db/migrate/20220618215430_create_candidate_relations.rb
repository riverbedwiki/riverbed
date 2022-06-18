class CreateCandidateRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_relations do |t|
      t.belongs_to :dependency
      t.belongs_to :proposition

      t.timestamps
    end
  end
end
