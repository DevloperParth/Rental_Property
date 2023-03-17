class User < ApplicationRecord
  validates_uniqueness_of :role, if: ->(user) { user.role == 'admin' }
  has_many :properties
  has_many :carts
  has_many :properties, through: :carts
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum :role, { seller: 'sellers', buyer: 'buyers', admin: 'admin' }, prefix: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable


         
end
