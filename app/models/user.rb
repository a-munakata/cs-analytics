class User < ActiveRecord::Base
  #=====================> assignments
  #attr_protected  :customer_id, :last_4_digits, :plan_id, :account_id, :api_token, :invite_token, :invite_count
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :confirmation_token, :confirmed_at, :confirmation_sent_at,
                  :job_domain_id, :completed_tutorial, :is_agree_eula,
                  :stripe_token, :coupon
  attr_accessor   :stripe_token, :coupon, :temp_role

  attr_accessible :name, :email, :job_domain_id, :temp_role, as: :admin

  serialize :completed_tutorial, Array  
end
