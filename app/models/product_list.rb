# == Schema Information
#
# Table name: product_lists
#
#  id         :uuid             not null, primary key
#  favorited  :boolean          default(FALSE), not null
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
class ProductList < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user_id }

  scope :ordered, -> { order({ favorited: :desc }, :name) }
end
