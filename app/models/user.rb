class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"


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


  def full_name
    "#{first_name} #{last_name}"
  end
end
