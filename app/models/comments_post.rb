class CommentsPost < ApplicationRecord
  belongs_to :post
  belongs_to :comment
end
