// ARGO_PROFILER this tracks the temp, humid, social time ( in sheet form ) for each box in ARGO,
//               also makes a .csv aggregate file as a summary for each CSV in the directory every day.
//               PROFILER runs avery 10 seconds, and AggregateData



PImage img;
Table table;
 int  x1 = 0;
 int  y1 = 0;
 int  x2 = 0;
 int  y2 = 0;
 int y1a = 0;
 int y2a = 0;
int[] BOXa = {0,0,0,0,0,0 }; 
String[] BOX_ID = {"","","","","",""}; 
String[] BIRD_ID = {"","","","","",""}; 
String fileName;// = str(year()) + str('_')+ str(month()) + str('_')+ str(day());
int s = 50;
 int[] Xval = {10,10,10,10,10,10};
 int[] Yval = {1*s,2*s,3*s,4*s,5*s,6*s}; 
String[] ENTRY = {"11.20.15","11.20.15","11.20.15","11.20.15","11.20.15","11.20.15"}; 
int[] Timer = {0,22,30,4440,003,004}; 
void setup() {
  size(800,400);
   background(0, 0, 0);
}

void draw() {
  background(0, 0, 0);
  GetBoxInfo();
     monthString = str(year()) + str('_')+ str(month()); //this filename is of the form year+month+day+readingCounter
// Get this month's data
      String[] animals = new String[4];
animals[0] = "/Users/ARGO/Documents/MATLAB/ARGO/";
animals[1] = "ARCHIVE/";
animals[2] = monthString;
animals[3] = ".csv";

String monthString = join(animals, "");
  table = loadTable(filename, "header");

  for (TableRow row : table.rows()) {
    
    int id = row.getInt("id");
    int dat = row.getInt("Humidity");
    int dat2 = row.getInt("Temperature (Celcius)");

   

for(int i = 0; i < 6; i = i+1){

String[] txt2 = new String[3];
String[] txt3 = new String[3];
txt2[0] = BOX_ID[i]; txt2[1] = ":  "; txt2[2] = BIRD_ID[i];
txt3[0] = "Entry Date:"; txt3[1] = ":  "; txt3[2] = ENTRY[i];
String disptxt = join(txt2, "");
String disptxt2 = join(txt3, "");
if(BOXa[i] ==0){
  fill(90, 92, 90, 94);
}else
  
fill(0, 102, 153, 204);
textSize(16);
text(disptxt, Xval[i], Yval[i]);
text(disptxt2, Xval[i], Yval[i]+22);
//text(Timer[i], Xval[i], Yval[i]+44);
//println(BIRD_ID[i]);
      String[] boxDAT = new String[4];
boxDAT[0] = "/Users/ARGO/Documents/MATLAB/ARGO/";
boxDAT[1] = "ARCHIVE/";
boxDAT[2] = monthString;
boxDAT[3] = ".png";

save(boxDAT);

}
delay(3000);

 
}