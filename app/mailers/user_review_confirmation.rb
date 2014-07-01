class UserReviewConfirmation < ActionMailer::Base
  default from: "admin@thecoffeefilter.com"

  def reviewer_confirmation(user, review)
    @user = user
    @review = review

    mail(to: @user.email, subject: "#{user.first_name} has reviewed the coffee shop you added!")
  end

end
