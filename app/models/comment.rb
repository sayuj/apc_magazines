class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :sub_comments, class_name: 'Comment', foreign_key: 'parant_id'
end
