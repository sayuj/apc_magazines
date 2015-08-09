class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :sub_comments, class_name: 'Comment', foreign_key: 'parent_id'
  scope :direct, ->{ where parent_id: nil }
end
