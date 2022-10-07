# == Schema Information
#
# Table name: product_items
#
#  id              :uuid             not null, primary key
#  category        :string           default("other"), not null
#  name            :string           not null
#  position        :integer          not null
#  slug            :string           not null
#  status          :string           default("active"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_list_id :uuid             not null
#  user_id         :uuid             not null
#
class ProductItem < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :list, class_name: "ProductList", foreign_key: :product_list_id
  acts_as_list scope: :list

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user_id }

  enum status: { active: "active" }
end
