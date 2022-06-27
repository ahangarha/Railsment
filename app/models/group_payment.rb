class GroupPayment < ApplicationRecord
  belongs_to :payment_id
  belongs_to :group_id
end
