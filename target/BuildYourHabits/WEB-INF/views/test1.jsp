<!DOCTYPE html>
<html>
<head>
	<title>Build Your Habits CALENDAR</title>
	
	<style>
	
		#calendar-container{
			padding: 10px;
			width: 210px;
			height: 210px;
			text-align: center;
			border: 1px solid #eee;
			border-radius: 10px;
			font-size: 16px;
			font-family: Arial;
			background-image: linear-gradient(#fff, #d3d3d3);
		}
		
		#calendar-container>div{
			padding: 0;
			margin-bottom: 10px;
		}
		
		#calendar-month-year{
			margin: 5px;
		}
		
		#calendar-dates>table>tr>td{
			padding: 5px;
			
			
		}
		
	</style>
	
</head>
<body>

	<div id="calendar-container">
		<div id="calendar-header">
			<span id="calendar-month-year"></span>
		</div>
		<div id="calendar-dates">
		</div>
	</div>



<script>
window.onload = function(){
	var d = new Date();
	var month_name = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
	var month = d.getMonth();
	var year = d.getFullYear();
	var first_date = month_name[month] + " " + 1 + " " + year;
	var tmp = new Date(first_date).toDateString();
	var first_day = tmp.substring(0, 3);	//Mon
	var day_name = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
	var day_no = day_name.indexOf(first_day);	//1
	var days = new Date(year, month + 1, 0).getDate();		//30
	
	var calendar = get_calendar(day_no, days);
	document.getElementById("calendar-month-year").innerHTML = month_name[month] + " " + year;
	document.getElementById("calendar-dates").appendChild(calendar);
	
}

function get_calendar(day_no, days){
	var table  = document.createElement('table');
	var tr = document.createElement('tr');
	
	//row for the day letters
	for(var c=0; c<= 6; c++){
		var td = document.createElement('td');
		td.innerHTML = "SMTWTFS"[c];
		tr.appendChild(td);
	}
	table.appendChild(tr);
	
	//create second row
	tr = document.createElement('tr');
	var c;
	for (c=0;c<=6;c++){
		if(c == day_no){
			break;
		}
		
		var td = document.createElement('td');
		td.innerHTML = "";
		tr.appendChild(td);
		
		var count = 1;
		for(; c<=6;c++){
			var td = document.createElement('td');
			td.innerHTML = count;
			count++;
			tr.appendChild(td);
		}
		
		table.appendChild(tr);
		
		//rest of the date rows
		for(var r=3;r<=6;r++){
			tr = document.createElement('tr');
			for(var c=0;c<=6;c++){
				if(count > days){
					table.appendChild(tr);
					return table;
				}
				var td = document.createElement('td');
				td.innerHTML = count;
				count++;
				tr.appendChild(td);
			}
			table.appendChild(tr);
		}
	}
	
}
</script>

</body>
</html>