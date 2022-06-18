class CreatePerspectives < ActiveRecord::Migration[7.0]
  def change
    create_table :perspectives do |t|
      t.string :title, null: false
      t.text :body

      t.timestamps
    end
  end
end
