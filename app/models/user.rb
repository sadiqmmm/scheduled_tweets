class User < ApplicationRecord
  has_secure_password
  before_commit :donwcase_email, only: %i[new create edit update]

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid'
  }
  validates :password, length: { minimum: 8, maximum: 40 }

  private

  def donwcase_email
    self.email = email.downcase
  end
end
