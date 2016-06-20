class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one_time_password(encrypted: true)
  def send_two_factor_authentication_code
    OtpMailer.otp_code(self.id, otp_code).deliver
  end
end

