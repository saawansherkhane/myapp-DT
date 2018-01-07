class Subscriber < ApplicationRecord
  validates :name, presence: true, 
                   length: { minimum: 4 }
end
