#!/usr/bin/perl

use strict;
use warnings;
use English;

# PSGI
# This is from the google charts demo
my $head = q{
  <html>
    <head>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  function drawChart(){
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Task');
    data.addColumn('number', 'Hours per Day');
    data.addRows([
        ['Work',   11],
        ['Eat',     2],
        ['Commute', 2],
        ['TV',      2],
        ['Sleep',   7],
    ]);

    var options = {
      width: 450, height: 300,
      title: 'My Daily Activities'
    };

    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }

  var gaugeData = new google.visualization.DataTable();
  gaugeData.addColumn('number', 'Server1');
  gaugeData.addColumn('number', 'Server2');
  gaugeData.addRows(2);
  gaugeData.setCell(0,0,100);
  gaugeData.setCell(0,1,100);
  </script>
  </head>
};
my $body = q{
  <body>
    Hello, world!
    <div id="chart_div"></div>
    And now for some gauges
    <div id="gauge_div">
  </body>
};
my $tail = q{</html>};

my $app = sub {
  my $env = shift;
  return [
    200,
    ['Content-Type', 'text/html'],
    [$head . $body . $tail ],
    ];
};

# I really like this url:
# http://code.google.com/apis/ajax/playground/?type=visualization#categoryfilter_control
# as it lets the user pick the gauges to display (ie, in a dropdown/picklist kind of way)


