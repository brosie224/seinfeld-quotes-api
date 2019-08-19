class Quote < ApplicationRecord
    validates :content, presence: true
    validates :character, presence: true
end
