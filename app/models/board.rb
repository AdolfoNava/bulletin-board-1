# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :active_posts, -> {where('expires_on > ?', Time.now)}, class_name: "Post"
  has_many :expired_posts, -> {where('expires_on < ?', Time.now)}, class_name: "Post"
end
