class CreateObjections < ActiveRecord::Migration[7.0]
  def change
    create_table :objections do |t|
      t.references :theory, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body

      t.timestamps
    end
  end
end
