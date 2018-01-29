class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :email
      t.string :subject
      t.string :phone
      t.string :message_type

      t.timestamps
    end
  end
end
