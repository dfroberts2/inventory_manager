$(document).ready(function(){
	if ($('#trans-chart-container').length) {
		google.charts.load('current', {packages: ['corechart']});
		google.charts.setOnLoadCallback(drawBarChart);

		function drawBarChart() {
			var dataArray = [["Category", "Retail Value", { role: "style" } ]]
			$('.category-row').each(function() {
				dataArray.push([$(this).find('.category-name').html(),parseFloat($(this).find('.retail-sum').html().replace(",","")),randomHexColor()])
			})
			var data = new google.visualization.arrayToDataTable(dataArray);
			var view = new google.visualization.DataView(data)
	      	var options = {
	        	title: "Retail Values by Category",
	        	bar: {groupWidth: "95%"},
	        	legend: { position: "none" },
	        	height: 320,
	        	vAxis: {format: '$' },
	        	hAxis: {textStyle: {fontSize: 12}}
	      	};
			var chart = new google.visualization.ColumnChart(document.getElementById('trans-chart-container'));
			chart.draw(view, options)
		};
	} else if ($('.monthly-values').length > 1) {
		google.charts.load('current', {packages: ['corechart', 'line']});
		google.charts.setOnLoadCallback(drawLineChart);

		function drawLineChart() {
			var dataArray = [["Date", "Retail Value"]]
			$('.monthly-values').each(function() {
				dataArray.push([new Date(Date.parse($(this).find('.inventory-date').html())), parseFloat($(this).find('.inventory-value').html())])
			});
			var data = new google.visualization.arrayToDataTable(dataArray);
			var options = {
				hAxis: {title: 'Date', format: 'MM/dd/yy', textStyle: {fontSize: 12}},
				vAxis: {title: 'Total Inventory Retail Value', format: '$###,###', minValue: 0},
				height: 300,
				width: 1000,
				legend: { position: "none" },
				pointSize: 10,
	          	series: { 0: { pointShape: 'square' } }
			}
			var chart = new google.visualization.LineChart(document.getElementById('dept-chart-container'));
			chart.draw(data, options);

		}
	}	
	function randomHexColor(){
		return '#'+Math.floor(Math.random()*16777215).toString(16);
	}
});