class CreateCommentsPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :comments_posts do |t|
      t.references :comment 
      t.references :post
      t.timestamps
    end
  end
end
