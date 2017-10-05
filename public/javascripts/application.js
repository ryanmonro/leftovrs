var deviceLat = '-37.818624299999996';
var deviceLong = '144.9593399';

// Get user's location if available
function getLocation() {
  if (navigator.geolocation) {
    console.log("got location");
    navigator.geolocation.getCurrentPosition(setPosition);
  } else { 
    console.log("didn't got location");
    setLocations(false);
  }
}

function setPosition(position) {
  deviceLat = position.coords.latitude;
  deviceLong = position.coords.longitude;
  setLocations(true);
}

// source: https://stackoverflow.com/questions/18883601/function-to-calculate-distance-between-two-coordinates-shows-wrong

//This function takes in latitude and longitude of two location and returns the distance between them as the crow flies (in km)
function calcCrow(lat1, lon1, lat2, lon2) {
  var R = 6371; // km
  var dLat = toRad(lat2-lat1);
  var dLon = toRad(lon2-lon1);
  var lat1 = toRad(lat1);
  var lat2 = toRad(lat2);

  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c;
  return d;
}

// Converts numeric degrees to radians
function toRad(Value) {
    return Value * Math.PI / 180;
}

// end stackoverflow code

function setLocations(cond){
  if (window.newPost){
    document.querySelector("#latitude").value = deviceLat;
    document.querySelector("#longitude").value = deviceLong;
  } else {
    var locations = document.querySelectorAll('.location');
    locations.forEach(function(loc){
      var latlong = loc.textContent.split(',');
      if (cond) {
        console.log(latlong);
        var distance = calcCrow(deviceLat, deviceLong, latlong[0], latlong[1]);
        if (distance < 1) {
          loc.textContent = (distance * 1000).toFixed(0) + "m away";
        } else {
          loc.textContent = distance.toFixed(1) + "km away";
        }
        loc.className = "location-show"
      } else {
        loc.textContent = latlong[0].tofixed(2) + ", " + latlong[0].tofixed(2); 
      }
    });
  }
}

getLocation();