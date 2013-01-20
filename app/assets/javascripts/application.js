// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


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

