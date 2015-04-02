Given /^a user with phone number "(.*?)" and verification code "(.*?)" exists$/ do |phone_number, verification_code|
  Users::FindAndGenerateVerificationCode.(phone_number, success: ->(user) {
    @user = user
  })

  @user.verification_codes.first.update!(code: verification_code)
end

Given /^his authentication token is "(.*?)"$/ do |token|
  AuthenticationToken.get_valid_token(@user)
  @user.authentication_tokens.first.update_attributes(token: token)
end
