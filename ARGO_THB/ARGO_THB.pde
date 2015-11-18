/*
   ===========================================
   |        ARGO Behavioral Rig              |
   ===========================================

 11.18.2015
 by: WALIII

  Hardware:
  * Temperature and Humidity sensors connected to Arduino input pins
  * Digital Switches on each box ( BOX01 thoguh BOX06)
  * Arduino connected to computer via USB cord

  Software:
  *Arduino programmer
  *Processing (download the Processing software here: https://www.processing.org/download/
  *Download the Software Serial library from here: http://arduino.cc/en/Reference/softwareSerial



*/

import processing.serial.*;
Serial myPort; //creates a software serial port on which you will listen to Arduino
Table dataTable; //table where we will read in and store values. You can name it something more creative!
Table table;

int numReadings = 5; //keeps track of how many readings you'd like to take before writing the file.
int readingCounter = 0; //counts each reading to compare to numReadings.
  String currentday = str(minute());
float H = 0;
float T = 0;
float STAT = 1;
long currentMillis = millis();
long previousMillis = 0;
float timer = 0;
String fileName;
void setup()
{
    size(400, 500, P3D);
  String portName = Serial.list()[2];
table = new Table();
myPort = new Serial(this, portName, 9600); //set up your port to listen to the serial port

  table.addColumn("id"); //This column stores a unique identifier for each record. We will just count up from 0 - so your first reading will be ID 0, your second will be ID 1, etc.

  //the following adds columns for time. You can also add milliseconds. See the Time/Date functions for Processing: https://www.processing.org/reference/
  table.addColumn("year");
  table.addColumn("month");
  table.addColumn("day");
  table.addColumn("hour");
  table.addColumn("minute");
  table.addColumn("second");

  //the following are dummy columns for each data value. Add as many columns as you have data values. Customize the names as needed. Make sure they are in the same order as the order that Arduino is sending them!
  table.addColumn("Humidity");
  table.addColumn("Temperature (Celcius)");
table.addColumn("Temperature (Fahrenheit)");
table.addColumn("BOX 01 DoorStatus");

//MULTIDAY TABLE
dataTable = new Table();
dataTable.addColumn("id");
dataTable.addColumn("year");
dataTable.addColumn("month");
dataTable.addColumn("day");
dataTable.addColumn("MAX Humidity");
dataTable.addColumn("MIN Humidity");
dataTable.addColumn("MAX Temperature (Celcius)");
dataTable.addColumn("MIN Temperature (Celcius)");
dataTable.addColumn("BOX 01 social time");

}

void serialEvent(Serial myPort){
 String val = myPort.readStringUntil('\n'); //The newline separator separates each Arduino loop. We will parse the data by each newline separator.
  if (val!= null) { //We have a reading! Record it.
    val = trim(val); //gets rid of any whitespace or Unicode nonbreakable space
    println(val); //Optional, useful for debugging. If you see this, you know data is being sent. Delete if  you like.
    float sensorVals[] = float(split(val, ',')); //parses the packet from Arduino and places the valeus into the sensorVals array. I am assuming floats. Change the data type to match the datatype coming from Arduino.

    TableRow newRow = table.addRow(); //add a row for this new reading
    newRow.setInt("id", table.lastRowIndex());//record a unique identifier (the row's index)
STAT = sensorVals[3];

    //record time stamp
newRow.setInt("year", year());
newRow.setInt("month", month());
newRow.setInt("day", day());
newRow.setInt("hour", hour());
newRow.setInt("minute", minute());
newRow.setInt("second", second());

    ////record sensor information. Customize the names so they match your sensor column names.
newRow.setFloat("Humidity", sensorVals[0]);
newRow.setFloat("Temperature (Celcius)", sensorVals[1]);
newRow.setFloat("Temperature (Fahrenheit)", sensorVals[2]);
newRow.setFloat("BOX 01 DoorStatus", sensorVals[3]);

readingCounter++; //optional, use if you'd like to write your file every numReadings reading cycles
    T = sensorVals[1];
    H = sensorVals[0];
    ////saves the table as a csv in the same folder as the sketch every numReadings.
    //if (readingCounter % numReadings ==0)//The % is a modulus, a math operator that signifies remainder after division. The if statement checks if readingCounter is a multiple of numReadings (the remainder of readingCounter/numReadings is 0)
    String compareday = str(minute());
    if (currentday.equals(compareday) == false)
    {
      print(currentday);
      print("  vs  ");
      println(str(minute()));
     currentday = str(minute());
     fileName = str(year()) + str('_')+ str(month()) + str('_')+ str(day())  + str(minute())+ str('_')+ str(table.lastRowIndex()); //this filename is of the form year+month+day+readingCounter

      String[] animals = new String[3];
animals[0] = "/Users/glab/Documents/DATA/LOGS/";
animals[1] = fileName;
animals[2] = ".csv";

String filename = join(animals, "");
      println(filename);



// multi-day tracking
    TableRow newRow2 = dataTable.addRow(); //add a row for this new reading
    newRow2.setInt("id", dataTable.lastRowIndex());//record a unique identifier (the row's index)
    int maxH = 0;
    int maxC = 0;
    int minH = 100;
    int minC = 100;

        for(TableRow row : table.rows()) {
            maxH = max(maxH, row.getInt("Humidity"));
            maxC = max(maxC, row.getInt("Temperature (Celcius)"));
            minH = min(minH, row.getInt("Humidity"));
            minC = min(minC, row.getInt("Temperature (Celcius)"));
        }

    println("Max humiditiy: " + maxH);
    println("Max temp (C): " + maxC);


    newRow2.setInt("year", year());
    newRow2.setInt("month", month());
    newRow2.setInt("day", day());
    newRow2.setFloat("MAX Humidity", maxH);
    newRow2.setFloat("MIN Humidity", minH);
    newRow2.setFloat("MAX Temperature (Celcius)", maxC);
    newRow2.setFloat("MIN Temperature (Celcius)", minC);
    newRow2.setFloat("BOX 01 social time", timer);
     timer = 0;



   //saveTable(table, "/Users/ARGO/Documents/DATA/new2.csv");
      saveTable(table, filename); //Woo! save it to your computer. It is ready for all your spreadsheet dreams.
    saveTable(dataTable, "/Users/glab/Documents/DATA/LOGS/new2.csv");
 table.clearRows();
  }
   }
}

void draw()
{
draw_ui();
  //visualize your sensor data in real time here! In the future we hope to add some cool and useful graphic displays that can be tuned to different ranges of values.
}

void stop() {
  myPort.stop();
}
