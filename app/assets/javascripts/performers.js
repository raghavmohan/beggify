
function getLocation()
{
  if (navigator.geolocation)
  {
    navigator.geolocation.getCurrentPosition(getPerformers);
  }
  else{console.log("Geolocation is not supported by this browser.");}
}

if (window.location.pathname == '/')
	getLocation();


function getPerformers(position)
{
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;

	//window.location.replace("performers/?lat="+latitude+"&long="+longitude);	
	$.get("nearby", { latitude: latitude, longitude: longitude },
  	function(data){
  		console.log(data);
  	}
	);
	
}

