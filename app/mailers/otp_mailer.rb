class OtpMailer < ApplicationMailer
  default from: "noreply@example.com"

  def otp_code(user_id, otp_code)
    @user = User.find(user_id)
    @otp_code = otp_code
    mail to: [@user.email], subject: "Your 2 Factor OTP Code"
  end
end