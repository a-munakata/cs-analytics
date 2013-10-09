#encoding: utf-8
require 'date'

module ActivitiesChart
  include BasicChart

  def users_chart(users, waiters, limit, interval)
    users_count = Hash[*users_count(users,waiters,limit,interval)[0].compact.flatten]
    waiters_count = Hash[*users_count(users,waiters,limit,interval)[1].compact.flatten]

    chart_data = {
      title: {
          text: main_title(interval)
      },
      xAxis: {
          categories: users_count.keys
      },
      yAxis: {
          title: {
              text: 'users'           
          }
      },
      series: [{
          name: 'ユーザー数',
          data: users_count.values
      },
      {
          name: 'ウエイター数',
          data: waiters_count.values
      }]
    }

    chart_data[:xAxis].store(:labels, {step: 3}) if limit > 20

    basic_chart_option.deep_merge(chart_data)
  end

  def main_title(interval)
    case interval
      when "monthly"
        "月ごとのユーザー増加推移"
      when "daily"    
        "最近1ヶ月のユーザー増加推移"    
    end
  end

  def users_count(users, waiters, n, interval)
    start_period = n - 1
    end_period   = n
    
    [users, waiters].collect do |target|
      unless target.nil?
        n.times.collect do |m|
          [
              (Time.now.to_date.get_start_period(start_period, interval, m) ).strftime("%m/%d"),
              target.
                  where("created_at < ?", (Time.now.to_date.set_time(interval).get_start_period(start_period, interval, m) ) ).
                  where("created_at > ?", (Time.now.to_date.get_end_period(end_period, interval, m) ) ).
                  count
          ]
        end
      end
    end    
  end

  Fixnum.class_eval do
    module SetDate
      def get_period(interval)
        case interval
          when "monthly"
            month
          when "daily"
            day
        end
      end
    end
    include SetDate
  end


  Date.class_eval do
    module SetTime
      def get_start_period(start_period, interval, m)
        change(:hour => 0, :min => 0, :sec => 0) - (start_period-m).get_period(interval)
      end
      def get_end_period(end_period, interval, m)
        change(:hour => 0, :min => 0, :sec => 0) - (end_period-m).get_period(interval)
      end

      def set_time(interval)
        case interval
          when "monthly"
            end_of_month
          when "daily"
            self
        end
      end

    end
    include SetTime
  end
end
