class Inbox < ActiveRecord::Base
  include InboxesHelper
  #=====================> modules
  #rolify

  #=====================> assignments
  #attr_protected :role_name, :number_of_processing_survey
  attr_protected :duplicating_count

  #=====================> associations
  has_one  :owner,              :class_name => "User",        :foreign_key => "account_id"
  has_many :inbox_chains,       :dependent  => :destroy
  has_many :users,              :through    => :inbox_chains

  has_many :invitations,  :dependent  => :destroy
  has_many :surveys             # 削除しない

  scope :white,               where(role_name: ["free", "white", "", nil])
  scope :light_blue,          where(role_name: "light_blue")
  scope :blue,                where(role_name: "blue")
  scope :light_blue_annual,   where(role_name: "light_blue_annual")
  scope :blue_annual,         where(role_name: "blue_annual")
  scope :navy_annual,         where(role_name: "blue_annual")
  scope :ultramarine_annual,  where(role_name: "ultramarine")
  scope :loss_time,           where(role_name: "loss_time")
  scope :black,               where(role_name: "black")
  scope :awkward,             where(is_awkward: true)
end
