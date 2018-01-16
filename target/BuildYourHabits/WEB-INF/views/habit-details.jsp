<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container">
	<br/>
	
	<h1>${habit.description}</h1>
	
	<br/>
	
	<a class="btn btn-success" href="">Mark this day as successful</a>
	
	<br/>
	<br/>
	
	<p id="daysLeft" style="font-size:32px;"></p>
	
	<br/>
	<br/>
	
	<p style="font-size:26px;">Current streak:</p>
	<p style="font-size:26px;">Longest streak:</p>
	<p style="font-size:26px;">Success Rate:</p>
	<p style="font-size:26px;">Completion Rate: <span style="font-size:30px; font-weight: bold;">${habit.completionRate}%</span></p>
	
	<br/>
	<br/>
	
	<a class="btn btn-info" href="./update-habit?id=${habit.habitID}">Update</a>
	<a class="btn btn-danger" href="./list-habits">Return</a>
</div>

<script>
	$(document).ready(function() {
		var daysLeft =<jstl:out value="${habit.daysLeft}"/>
		
		if (daysLeft > 0)
			document.getElementById('daysLeft').innerHTML = "<span style='color:red; font-weight: bold;'>${habit.daysLeft}</span> days left to build the habit!";
		else document.getElementById('daysLeft').innerHTML = "<span style='color:grey;'>Habit completed!</span>";
	});
</script>

<%@ include file="common/footer.jspf" %>