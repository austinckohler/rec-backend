class Area < ApplicationRecord
    has_many :activities, :links, :publishes
end
