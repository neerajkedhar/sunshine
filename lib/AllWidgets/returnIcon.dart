import 'package:intl/intl.dart';

var bolt = 'lib/AllIcons/bolt.png';
var cloudRain = 'lib/AllIcons/Cloud_Rain.png'; //
var cloudSnow = 'lib/AllIcons/Cloud_Snow.png'; //
var cloudWind = 'lib/AllIcons/Cloud_Wind.png';
var drop = 'lib/AllIcons/Drop.png';
var fogCloud = 'lib/AllIcons/Fog_Cloud.png';
var fog = 'lib/AllIcons/Fog.png'; //
var hailRain = 'lib/AllIcons/Hail_Rain.png';
var snowSun = 'lib/AllIcons/Snow_Sun.png';
var snowflake = 'lib/AllIcons/SnowFlake.png';
var rainBolt = 'lib/AllIcons/Rain_Bolt.png'; //
var wind = 'lib/AllIcons/Wind.png';
var moonBoltRain = 'lib/AllIcons/Moon_Bolt_Rain.png';
var moonCloud = 'lib/AllIcons/Moon_Cloud.png'; //
var moonFog = 'lib/AllIcons/Moon_Fog.png';
var moon = 'lib/AllIcons/moon.png'; //
var cloudRainMoon = 'lib/AllIcons/Cloud_Rain_Moon.png'; //
var snowMoon = 'lib/AllIcons/Snow_Moon.png';
var fogMoon = 'lib/AllIcons/Fog_Moon.png';
var windMoon = 'lib/AllIcons/Wind_Moon.png';
var windSun = 'lib/AllIcons/Wind_Sun.png';
var sunBoltRain = 'lib/AllIcons/Sun_Bolt_Rain.png';
var sunCloud = 'lib/AllIcons/Sun_Cloud.png'; //
var sunFog = 'lib/AllIcons/Sun_Fog.png';
var sun = 'lib/AllIcons/sun.png'; //
var fogSun = 'lib/AllIcons/Fog_Sun.png';
var cloudRainSun = 'lib/AllIcons/Cloud_Rain_Sun.png'; //

returnIcon(bool isDay, var main) {
  if (isDay) {
    if (main == 'Thunderstorm') {
      return rainBolt;
    } else if (main == 'Drizzle') {
      return cloudRainSun;
    } else if (main == 'Rain') {
      return cloudRain;
    } else if (main == 'Snow') {
      return cloudSnow;
    } else if (main == 'Clear') {
      return sun;
    } else if (main == 'Clouds') {
      return sunCloud;
    } else if (main == 'Mist' ||
        main == 'Smoke' ||
        main == 'Haze' ||
        main == 'Dust' ||
        main == 'Fog' ||
        main == 'Sand' ||
        main == 'Ash' ||
        main == 'Squall') {
      return fog;
    } else {
      return sun;
    }
  } else {
    if (main == 'Thunderstorm') {
      return rainBolt;
    } else if (main == 'Drizzle') {
      return cloudRainMoon;
    } else if (main == 'Rain') {
      return cloudRain;
    } else if (main == 'Snow') {
      return cloudSnow;
    } else if (main == 'Clear') {
      return moon;
    } else if (main == 'Clouds') {
      return moonCloud;
    } else if (main == 'Mist' ||
        main == 'Smoke' ||
        main == 'Haze' ||
        main == 'Dust' ||
        main == 'Fog' ||
        main == 'Sand' ||
        main == 'Ash' ||
        main == 'Squall') {
      return fog;
    } else {
      return moon;
    }
  }
}

returnDailyIcon(var main) {
  if (main == 'Thunderstorm') {
    return rainBolt;
  } else if (main == 'Drizzle') {
    return cloudRainSun;
  } else if (main == 'Rain') {
    return cloudRain;
  } else if (main == 'Snow') {
    return cloudSnow;
  } else if (main == 'Clear') {
    return sun;
  } else if (main == 'Clouds') {
    return sunCloud;
  } else if (main == 'Mist' ||
      main == 'Smoke' ||
      main == 'Haze' ||
      main == 'Dust' ||
      main == 'Fog' ||
      main == 'Sand' ||
      main == 'Ash' ||
      main == 'Squall') {
    return fog;
  }
}

var isDayd;
returnIconH(var main, time) {
  var timed = int.parse(new DateFormat.H().format(time));
  if (timed >= 6 && timed <= 17) {
    isDayd = true;
  } else {
    isDayd = false;
  }
  // print("yo this is time $timed and isDay is $isDayd");

  if (isDayd) {
    if (main == 'Thunderstorm') {
      return rainBolt;
    } else if (main == 'Drizzle') {
      return cloudRainSun;
    } else if (main == 'Rain') {
      return cloudRain;
    } else if (main == 'Snow') {
      return cloudSnow;
    } else if (main == 'Clear') {
      return sun;
    } else if (main == 'Clouds') {
      return sunCloud;
    } else if (main == 'Mist' ||
        main == 'Smoke' ||
        main == 'Haze' ||
        main == 'Dust' ||
        main == 'Fog' ||
        main == 'Sand' ||
        main == 'Ash' ||
        main == 'Squall') {
      return fog;
    } else {
      return sun;
    }
  } else {
    if (main == 'Thunderstorm') {
      return rainBolt;
    } else if (main == 'Drizzle') {
      return cloudRainMoon;
    } else if (main == 'Rain') {
      return cloudRain;
    } else if (main == 'Snow') {
      return cloudSnow;
    } else if (main == 'Clear') {
      return moon;
    } else if (main == 'Clouds') {
      return moonCloud;
    } else if (main == 'Mist' ||
        main == 'Smoke' ||
        main == 'Haze' ||
        main == 'Dust' ||
        main == 'Fog' ||
        main == 'Sand' ||
        main == 'Ash' ||
        main == 'Squall') {
      return fog;
    } else {
      return moon;
    }
  }
}
