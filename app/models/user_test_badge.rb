class UserTestBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  belongs_to :test
end
