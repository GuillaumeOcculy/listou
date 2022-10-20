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

  enum status: {
    active: "active",
    completed: "completed"
  }

  enum category: {
    baby: 'baby',
    beverage: 'beverage',
    books_and_culture: 'books_and_culture',
    bread: 'bread',
    diy: 'diy',
    fashion: 'fashion',
    fresh: 'fresh',
    frozen: 'frozen',
    fruit_and_vegetable: 'fruit_and_vegetable',
    game_and_toy: 'game_and_toy',
    garden_and_landscaping: 'garden_and_landscaping',
    high_tech: 'high_tech',
    home_and_decoration: 'home_and_decoration',
    home_appliance: 'home_appliance',
    hygiene_and_beauty: 'hygiene_and_beauty',
    maintenance_and_cleaning: 'maintenance_and_cleaning',
    meat_and_fish: 'meat_and_fish',
    other: 'other',
    parapharmacy: 'parapharmacy',
    pet: 'pet',
    salty_grocery: 'salty_grocery',
    sport_and_leisure: 'sport_and_leisure',
    sweet_grocery: 'sweet_grocery',
    video_game: 'video_game',
  }

  broadcasts_to ->(product_item) { [product_item.list, "product_items"] }, inserts_by: :prepend
end
