String heavyRain =
    "It's really coming down out there, better not to go out side";
String drizzling = "It's been raining on and off all day";
String clearSky = "We have a clear sky today";
String haze = "Covered in Haze";
String mist = "City covered in mist";
String fog = "Slow moving fog";
String thunder = "Thunderstorm or maybe it's just thor lightning in the sky";

String returningDesc(var given) {
  if (given == "extreme rain" || given == "very heavy rain") {
    return heavyRain;
  } else if (given == "drizzle" || given == "drizzle rain") {
    return drizzling;
  } else if (given == "clear sky") {
    return clearSky;
  } else if (given == "Haze" || given == "haze") {
    return haze;
  } else if (given == "mist" || given == "Mist") {
    return mist;
  } else if (given == "fog" || given == "Fog") {
    return fog;
  } else if (given == "thunderstorm" || given == "Thunderstorm") {
    return thunder;
  } else {
    return given;
  }
}
