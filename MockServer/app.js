"use strict"var express = require('express')var app = express()app.listen(3000)console.log('Our app is listening for request on port 3000')app.get('/data/2.5/weather', get_weather)function get_weather(request, response) {	response.json({
  "coord": {
    "lon": 118.7778,
    "lat": 32.0617
  },
  "weather": [
    {
      "id": 803,
      "main": "Clouds",
      "description": "broken clouds",
      "icon": "04d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 302.1,
    "feels_like": 302.4,
    "temp_min": 302.1,
    "temp_max": 302.1,
    "pressure": 1012,
    "humidity": 47,
    "sea_level": 1012,
    "grnd_level": 1010
  },
  "visibility": 10000,
  "wind": {
    "speed": 2.18,
    "deg": 123,
    "gust": 2.29
  },
  "clouds": {
    "all": 55
  },
  "dt": 1664512398,
  "sys": {
    "type": 1,
    "id": 9660,
    "country": "CN",
    "sunrise": 1664488662,
    "sunset": 1664531536
  },
  "timezone": 28800,
  "id": 1799962,
  "name": "Nanjing",
  "cod": 200
})}  
