#encoding: utf-8
require 'modules/activities_chart'

class ActivitiesController < ApplicationController  
  include ActivitiesChart
  
  def index
    # @limit = params[:text].to_i || 10
    @limit = 10
    @users = User
    @waiters = Waiter.all 
    @users_chart = monthly_users_chart(@users, @limit).to_json

    respond_to do |format|
      format.html
      format.js
    end
  end

end

