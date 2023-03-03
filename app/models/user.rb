class User < ApplicationRecord
validates_uniqueness_of :role, :if => lambda {|user| user.role == 'admin' }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum :role, { seller: 'sellers', buyer: 'buyers', admin: 'admin' }, prefix: true
  #enum role: [:seller, :buyer,:admin]
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

end
