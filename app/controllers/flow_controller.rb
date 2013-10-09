class FlowController < ApplicationController
  def index
    users = User.count
    customers_count = User.where("customer_id IS NOT NULL").count
    signed_up_users = User.where("confirmation_token IS NULL").count
    made_surveys = User.all.each.collect { |user| user if user.account.surveys.count != 0 }.compact.count

    @users_ratio = users.get_ratio(users)
    @made_surveys_ratio = made_surveys.get_ratio(users)
    @signedup_users_ratio = signed_up_users.get_ratio(users)
    @customers_count_ratio = customers_count.get_ratio(users)

    respond_to do |format|
      format.html
    end
  end


  # ====== method
  Fixnum.class_eval do
    module ExtendFixnum
      def get_ratio(denom)
        (self/denom.to_f*100).round(2)
      end
    end
    include ExtendFixnum
  end
end
