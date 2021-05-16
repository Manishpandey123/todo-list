class Task < ApplicationRecord
    
    validates :phone, presence: true, numericality: { only_integer: true, message: "Only integer allowed" }

end
