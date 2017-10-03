# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :content, :user_id, :post_id, presence: true

  belongs_to :author, class_name: "User", foreign_key: :user_id
  belongs_to :post, optional: true

  belongs_to :parent_comment, class_name: 'Comment', foreign_key: :parent_comment, optional: true
  has_many :child_comments, class_name: 'Comment', foreign_key: :parent_comment

end
