class CreateArguments < ActiveRecord::Migration[7.0]
  def change
    create_table :arguments do |t|
      t.references :subject, polymorphic: true, null: false
      t.string :title
      t.text :body

      t.integer :type, null: false
      t.timestamps
    end
  end
end
