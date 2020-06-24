class Area < ApplicationRecord
    has_many :activities
    has_many :links
    has_many :publishes
end
