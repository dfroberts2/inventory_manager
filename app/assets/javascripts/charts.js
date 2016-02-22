$(document).ready(function(){
	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var dataArray = [["Category", "Retail Value", { role: "style" } ]]
		$('.category-row').each(function() {
			dataArray.push([$(this).find('.category-name').html(),$(this).find('.retail-sum').html()])
		})

		var data = new google.visualization.arrayToDataTable(dataArray);

		var view = new google.visualization.DataView(data)

		view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      	var options = {
        	title: "Retail Values by Category",
        	bar: {groupWidth: "95%"},
        	legend: { position: "none" },
      	};

		
		 var chart = new google.visualization.ColumnChart(document.getElementById('chart-container'));

		chart.draw(view, options)
	};
});