class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  belongs_to :supplier

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end
end
