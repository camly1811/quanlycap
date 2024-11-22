class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Callback để tự động tạo username từ email
  before_validation :set_username_from_email, on: :create
  has_and_belongs_to_many :roles
  
  enum gender: { male: 0, female: 1, other: 2 }
  validates :first_name, :last_name, presence: true
  validates :username, presence: true
  # validates :phone, format: { with: /\A(03[2-9]|05[6|8|9]|07[0|6-9]|08[1-9]|09[0-9])\d{7}\z/ }

  def admin?
    roles.exists?(name: 'admin')
  end
  # Thêm thuộc tính login để cho phép đăng nhập bằng username hoặc email
  attr_accessor :login

  # Phương thức trả về tên đầy đủ
  def full_name
    "#{last_name} #{first_name}" if first_name.present? && last_name.present?
  end
  private
  # Phương thức tạo username từ email
  def set_username_from_email
    # Lấy phần trước dấu "@" trong email làm username
    self.username ||= email.split('@').first if email.present?
  end
end
