class User < ApplicationRecord
  has_secure_password
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  validates :password, 
            presence: true,
            length: { minimum: 6 }
  validates :first_name,
            presence: true,
            length: {in: 3..30}
  validates :last_name,
            presence: true,
            length: {in: 3..30}
  validates :email,
            presence: true,
            uniqueness: true,
            length: {in: 5..100},
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Wrong email format" }

end
