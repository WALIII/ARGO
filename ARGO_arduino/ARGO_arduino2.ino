// TRANSFER Temperature, Humidity and BOX door status to ARGO
// created by WALIII  // DHT library created by ladyada


//c: 11.18.2015
//by: WALIII



#include "DHT.h"

#define DHTPIN 2    // Digital Pin

// Arguments for different sensor types if we swithch to a better one:
#define DHTTYPE DHT11   // DHT 11
//#define DHTTYPE DHT22   // DHT 22  (AM2302), AM2321
//#define DHTTYPE DHT21   // DHT 21 (AM2301)

// NOTE: If using a board with 3.3V logic like an Arduino Due connect pin 1

// WIRING DIAGRAM:
//  Connect pin 2 of the sensor to whatever your DHTPIN is
//  Connect pin 4 (on the right) of the sensor to GROUND
//  Connect a 10K resistor from pin 2 (data) to pin 1 (power) of the sensor

DHT dht(DHTPIN, DHTTYPE);
String F1;


void setup() {
  Serial.begin(9600);
//  Serial.println("DHTxx test!");

  dht.begin();
}

void loop() {
  // Wait a few seconds between measurements.
  delay(2000);

  int h = dht.readHumidity();
  // Read temperature as Celsius (the default)
  int t = dht.readTemperature();
  // Read temperature as Fahrenheit (isFahrenheit = true)
  int f = dht.readTemperature(true);
  int BOX1 = digitalRead(4);
    int BOX2 = digitalRead(3);
      int BOX3 = digitalRead(5);
        int BOX4 = digitalRead(8);
          int BOX5 = digitalRead(7);
            int BOX6 = digitalRead(6);
  // Check if any reads failed and exit early (to try again).
  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println("Failed to read from DHT sensor...");
    return;
  }

// PRINT ALL VARIABLES
//Serial.print(h);
//  Serial.print(",");
//  Serial.print(t);
//    Serial.print(",");
//    Serial.print(f);
//      Serial.print(",");
//      Serial.print(BOX1);
//        Serial.print(",");
//        Serial.print(BOX2);
//          Serial.print(",");
//          Serial.print(BOX3);
//            Serial.print(",");
//            Serial.print(BOX4);
//              Serial.print(",");
//              Serial.print(BOX5);
//                Serial.print(",");
//                Serial.println(BOX6);

String F1;
F1 = F1+h+","+t+","+f+","+BOX1+","+BOX2+","+BOX3+","+BOX4+","+BOX5+","+BOX6;
Serial.println(F1);

}


void printDigits(int digits){
  // utility function for digital clock display: prints preceding colon and leading 0
  Serial.print(":");
  if(digits < 10)
    Serial.print('0');
  Serial.print(digits);
}
