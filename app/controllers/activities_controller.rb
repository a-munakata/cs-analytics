#encoding: utf-8
#require 'modules/activities_chart'

class ActivitiesController < ApplicationController
  include ActivitiesChart
  def dashboard
    @users_num = User.count || ""
    @surveys_num = Survey.count || ""
    @dau = User.active_user_in_a_day.count
    @wau = User.active_user_in_a_week.count
    @mau = User.active_user_in_a_month.count
    @customers_hash = Role.pluck(:name).collect{|role| Hash[*role, User.where(:plan_id => role).count] }

    respond_to do |format|
      format.html
    end
  end
  def index
    @months_limit = 10
    @days_limit = 30
    @users = User
    @waiters = Waiter

    @monthly_users_chart = users_chart(@users, @waiters, @months_limit, "monthly").to_json
    @daily_users_chart   = users_chart(@users, @waiters, @days_limit, "daily").to_json
    
    @charts = [@daily_users_chart, @monthly_users_chart]

    respond_to do |format|
      format.html
      format.js
    end
  end

end

