class CreateTheories < ActiveRecord::Migration[7.0]
  def change
    create_table :theories do |t|
      t.string :name, null: false
      t.text :body

      t.timestamps
    end
  end
end
