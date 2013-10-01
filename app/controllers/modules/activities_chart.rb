#encoding: utf-8

module  ActivitiesChart
   def monthly_users_chart(users,n)
      monthly_users_count = Hash[*monthly_users_count(users,n).flatten]
      basic_chart_option.deep_merge({
      title: {
          text: "月ごとのユーザー数"
      },
      xAxis: {
          categories: monthly_users_count.keys
      },
      yAxis: {
          title: {
              text: 'users'
          }
      },
      series: [{
          name: 'ユーザー数',
          data: monthly_users_count.values
      }]
    })
  end

  def basic_chart_option
    @colors           = ["#72b1c0", "#747dc0", "#d24623", "#7ba444", "#dc7b9a", "#e7b727", "#eaa21a", "#999999", "#c42525", "#a6c96a"]
      {
        exporting: {
          enabled: true
        },
        chart: {
          margin: 75,
          backgroundColor: "#f6f6f6",
          plotBorderColor: "#d4d4d4"
        },
        colors: @colors,
        navigation: {
          buttonOptions: {
            width: 30,
            height: 30,
            symbolFill: "#cccccc",
            symbolStroke: "#fff",
            symbolX: 15,
            symbolY: 15,
            theme: {
              r: 0,
              stroke: '#cccccc',
              fill: '#cccccc',
              states: {
                hover: {
                  stroke: '#72b1c0',
                  fill: '#72b1c0'
                },
                select: {
                  stroke: '#72b1c0',
                  fill: '#72b1c0'
                }
              }
            }
          }
        },
        plotOptions: {
            series: {
                lineWidth: 5
            }
        },
        credits: {
            enabled: false
        },
        title: {
            text: ""
        },
        xAxis: {
            allowDecimals: false,
            lineColor: "#4b4b4b",
            lineWidth: 1
        },
        yAxis: {
            allowDecimals: false,
            gridLineColor: '#d4d4d4',
            lineColor: "#4b4b4b",
            lineWidth: 1,
            title: {
                text: '回答数',
                style: {
                    color: "#4b4b4b"
                }
            }
        }
    }
  end

  def monthly_users_count(users, n)
    this_month = n
    last_month = n - 1

    n.times.collect do |m|
      [
          (Time.now.change(:day => 1,:hour => 0, :min => 0, :sec => 0) - (last_month-m).months ).strftime("%m/%d"),
          users.
              where("created_at < ?", (Time.now.end_of_month.change(:hour => 0, :min => 0, :sec => 0) - (last_month-m).months ) ).
              where("created_at > ?", (Time.now.change(:day => 1, :hour => 0, :min => 0, :sec => 0) - (this_month-m).months ) ).
              count
      ]
    end
  end

end
