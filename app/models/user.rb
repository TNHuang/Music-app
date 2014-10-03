class User < ActiveRecord::Base
  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  # validates :password, presence: true
  #dont call validate password because it will try to call the method

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
       self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def self.find_by_credentials(email, unencrypted_password)
    @user = User.find_by_email(email)
    return nil if @user.nil?

    @user.is_password?(unencrypted_password) ? @user : nil
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end