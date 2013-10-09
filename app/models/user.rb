class User < ActiveRecord::Base
  #=====================> assignments
  #attr_protected  :customer_id, :last_4_digits, :plan_id, :account_id, :api_token, :invite_token, :invite_count
  attr_protected :name, :email, :password, :password_confirmation, :remember_me, :confirmation_token, :confirmed_at, :confirmation_sent_at,
                  :job_domain_id, :completed_tutorial, :is_agree_eula,
                  :stripe_token, :coupon

  attr_protected :name, :email, :job_domain_id, :temp_role, as: :admin

  #serialize :completed_tutorial, Array

  #=====================> associations
  belongs_to  :account,           :dependent => :destroy,       :class_name => "Inbox",         :autosave => true
  #has_many    :inbox_chains,      :dependent => :destroy
  has_many    :inboxes,           :through   => :inbox_chains
  #has_many    :receipts

  #belongs_to :job_domain

  scope :active_user_in_a_day,    where("last_sign_in_at > ?", 1.day.ago)
  scope :active_user_in_a_week,   where("last_sign_in_at > ?", 1.week.ago)
  scope :active_user_in_a_month,  where("last_sign_in_at > ?", 1.month.ago)
  scope :awkwards,                where(is_awkward: true)

end
