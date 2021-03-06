class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :shipping
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :shipping
  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :images


  validates :name,length:{maximum:20}
  validates :description, length:{maximum:1000}
  validates :price,numericality:{greater_than_or_equal_to: 300} 

  with_options presence: true do
    validates :name
    validates :description
    validates :status
    validates :price
    validates :fee
    validates :profit
    validates :user_id
    validates :category_id 
    # validates :shipping_id
    validates :images

  end


  enum status: {
    新品未使用:1,未使用に近い:2,目立った傷や汚れなし:3,やや傷や汚れあり:4,傷や汚れあり:5,全体的に状態が悪い:6
  }
end