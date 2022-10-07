# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  slug                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  devise :database_authenticatable, :registerable,
        :validatable

  validates :first_name, presence: true

  private

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
