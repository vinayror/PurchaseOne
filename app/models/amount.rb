class Amount < ActiveRecord::Base
  belongs_to :purchase

   validates :price, numericality: { only_integer: true }
end
