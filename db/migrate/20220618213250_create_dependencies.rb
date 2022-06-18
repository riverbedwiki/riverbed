class CreateDependencies < ActiveRecord::Migration[7.0]
  def change
    create_table :dependencies do |t|
      t.string :title, null: false
      t.text :body
      t.belongs_to :proposition

      t.timestamps
    end
  end
end
