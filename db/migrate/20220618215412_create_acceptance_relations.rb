class CreateAcceptanceRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :acceptance_relations do |t|
      t.belongs_to :perspective
      t.belongs_to :proposition

      t.timestamps
    end
  end
end
