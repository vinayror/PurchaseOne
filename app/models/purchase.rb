class Purchase < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_many :amounts
  accepts_nested_attributes_for :amounts, reject_if: :all_blank, allow_destroy: true
end
