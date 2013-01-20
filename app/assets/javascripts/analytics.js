function drawPieChart(){
  // Load the Visualization API and the piechart package.
  google.load('visualization', '1.0', {'packages':['corechart']});
  // Set a callback to run when the Google Visualization API is loaded.
  google.setOnLoadCallback(drawVisual);
  function getData() {
    $.get(window.location.pathname+".json",
          function(data){
            var returnArr=[];
            $.each(data, function (){
              var f = this;
              $.get("/performance_amount/"+ this.id+".json", function (amount){
                returnArr.push([f.name, amount]);
              });
            });
            return returnArr;
          }
         );
  };
  // Callback that creates and populates a data table, 
  // instantiates the pie chart, passes in the data and
  // draws it.
  function drawVisual() {
    // Create the data table.
    var chartData = new google.visualization.DataTable();
    chartData.addColumn('string', 'Name');
    chartData.addColumn('number', 'Amount');
    $.get(window.location.pathname+".json",
          function(data){
            var returnArr=[["Name", "Amount"]];
            $.each(data, function (){
              var f = this;
              $.get("/performance_amount/"+ this.id+".json", function (amount){
                arr = []
                arr.push(f.name);
                arr.push(parseInt(amount,10));
                returnArr.push(arr);
              });
            });
            console.log(returnArr);
            var chartData = google.visualization.arrayToDataTable([
                                                                  ['Name', 'Amount'],                                  ['Classical',     311],
                                                                  ['Rock',  1340],
                                                                  ['Pop',  326],
                                                                  ['Punk', 123],
                                                                  ['Photos', 1000]
            ]);

            var options = {
              title: 'Earnings by Name',
              titleTextStyle: {color:"white"},
              width:300,
              height:400,
              backgroundColor:"transparent",
              legend: {position: "top", textStyle: {color: 'white'}},
            };

              var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
              chart.draw(chartData, options);
          }
         );
  }
}

function drawScatter(){
  // Load the Visualization API and the piechart package.
  google.load('visualization', '1.0', {'packages':['corechart']});
  // Set a callback to run when the Google Visualization API is loaded.
  google.setOnLoadCallback(drawVisual);
  function getData() {
    $.get(window.location.pathname+".json",
          function(data){
            var returnArr=[];
            $.each(data, function (){
              var f = this;
              $.get("/performance_amount/"+ this.id+".json", function (amount){
                returnArr.push([f.name, amount]);
              });
            });
            return returnArr;
          }
         );
  };
  // Callback that creates and populates a data table, 
  // instantiates the pie chart, passes in the data and
  // draws it.
  function drawVisual() {
    // Create the data table.
    var chartData = new google.visualization.DataTable();
    chartData.addColumn('string', 'Name');
    chartData.addColumn('number', 'Amount');
    $.get(window.location.pathname+".json",
          function(data){
            var returnArr=[["Name", "Amount"]];
            $.each(data, function (){
              var f = this;
              $.get("/performance_amount/"+ this.id+".json", function (amount){
                arr = []
                arr.push(f.name);
                arr.push(parseInt(amount,10));
                returnArr.push(arr);
              });
            });
            console.log(returnArr);
            var chartData = google.visualization.arrayToDataTable([
                                                                  ['Time', 'Amount', 'Other'],
                                                                  [0.5,    100, 1233],
                                                                  [4,  2133, 3412],
                                                                  [5,  255,323],
                                                                  [6, 4003, 1122],
                                                                  [2, 1000, 444]
            ]);

            var options = {
              title: 'Earnings by Time',
              titleTextStyle: {color:"white"},
              width:300,
              height:400,
              backgroundColor:"transparent",
              legend: {position: "top", textStyle: {color: 'white'}},
              vAxis: {title: 'Money',  titleTextStyle: {color: 'white'}, textStyle: {color:'white'}},  
              hAxis: {title: 'Time',  titleTextStyle: {color: 'white'}, textStyle: {color:'white'}}  
              };
              var chart = new google.visualization.ScatterChart(document.getElementById('scatter_div'));
              chart.draw(chartData, options);
          }
         );
  }
};

function drawTbl(){
  // Load the Visualization API and the piechart package.
  google.load('visualization', '1.0', {'packages':['corechart']});
  // Set a callback to run when the Google Visualization API is loaded.
  google.setOnLoadCallback(drawVisual);
  function getData() {
    $.get(window.location.pathname+".json",
          function(data){
            var returnArr=[];
            $.each(data, function (){
              var f = this;
              $.get("/performance_amount/"+ this.id+".json", function (amount){
                returnArr.push([f.name, amount]);
              });
            });
            return returnArr;
          }
         );
  };
  // Callback that creates and populates a data table, 
  // instantiates the pie chart, passes in the data and
  // draws it.
  function drawVisual() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        data.addColumn('number', 'Salary');
        data.addColumn('boolean', 'Full Time Employee');
        data.addRows([
          ['Mike',  {v: 10000, f: '$10,000'}, true],
          ['Jim',   {v:8000,   f: '$8,000'},  false],
          ['Alice', {v: 12500, f: '$12,500'}, true],
          ['Bob',   {v: 7000,  f: '$7,000'},  true]
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {showRowNumber: true});
  }
 };

drawScatter();
drawPieChart();
drawTbl();
