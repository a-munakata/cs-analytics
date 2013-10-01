jQuery ->
  $(".chart").each (index, element) ->
    if $(element).data('chart')?
        $(element).highcharts $(element).data('chart')