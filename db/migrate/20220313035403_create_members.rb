class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :username, null: false, index: {unique: true}
      t.string :email, index: {unique: true}
      t.string :password_digest

      t.timestamps
    end
  end
end
