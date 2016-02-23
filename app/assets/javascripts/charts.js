$(document).ready(function(){
	if ($('#chart-container').length) {
		google.charts.load('current', {packages: ['corechart']});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var dataArray = [["Category", "Retail Value", { role: "style" } ]]
			$('.category-row').each(function() {
				dataArray.push([$(this).find('.category-name').html(),parseFloat($(this).find('.retail-sum').html()),"gold"])
			})
			var data = new google.visualization.arrayToDataTable(dataArray);

			var view = new google.visualization.DataView(data)

			// view.setColumns([0, 1,
	  //                      { calc: "stringify",
	  //                        sourceColumn: 1,
	  //                        type: "string",
	  //                        role: "annotation" },
	  //                      2]);

	      	var options = {
	        	title: "Retail Values by Category",
	        	bar: {groupWidth: "95%"},
	        	legend: { position: "none" },
	        	height: 500,
	        	vAxis: {format: '$' }
	      	};

			
			 var chart = new google.visualization.ColumnChart(document.getElementById('chart-container'));

			chart.draw(view, options)
		};
	};
});