class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.references :post

      t.timestamps
    end
  end
end
