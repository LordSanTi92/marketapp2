class Advertisement < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :title, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :content, presence: true, length: { minimum: 10 }
  has_attached_file :image, styles: { large: '1000x1000', medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
