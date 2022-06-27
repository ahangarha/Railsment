class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_payments
  has_many :groups, through: :group_payments
end
