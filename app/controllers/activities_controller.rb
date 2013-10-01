#encoding: utf-8
require 'modules/activities_chart'

class ActivitiesController < ApplicationController  
  include ActivitiesChart
  
  def index
    @months_limit = 10
    @days_limit = 30
    @users = User
    @waiters = Waiter

    @monthly_users_chart = monthly_users_chart(@users, @waiters, @months_limit).to_json
    @daily_users_chart = daily_users_chart(@users, @waiters, @days_limit).to_json

    # @charts = [@monthly_users_chart, @weekly_users_chart]

    respond_to do |format|
      format.html
      format.js
    end
  end

end

