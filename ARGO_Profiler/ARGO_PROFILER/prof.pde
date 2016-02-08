//PImage img;
//Table table;
// int  x1 = 0;
// int  y1 = 0;
// int  x2 = 0;
// int  y2 = 0;
// int y1a = 0;
// int y2a = 0;
//int[] BOXa = {0,0,0,0,0,0 }; 
//String[] BOX_ID = {"","","","","",""}; 
//String[] BIRD_ID = {"","","","","",""}; 
//String fileName;// = str(year()) + str('_')+ str(month()) + str('_')+ str(day());
//int s = 50;
// int[] Xval = {10,10,10,10,10,10};
// int[] Yval = {1*s,2*s,3*s,4*s,5*s,6*s}; 
//String[] ENTRY = {"11.20.15","11.20.15","11.20.15","11.20.15","11.20.15","11.20.15"}; 
//int[] Timer = {0,22,30,4440,003,004}; 
//void setup() {
//  size(800,400);
//   background(0, 0, 0);
//}

//void draw() {
//  background(0, 0, 0);
//  GetBoxInfo();
//     fileName = str(year()) + str('_')+ str(month()) + str('_')+ str(day()); //this filename is of the form year+month+day+readingCounter

//      String[] animals = new String[3];
//animals[0] = "/Users/glab/Documents/DATA/LOGS/";
//animals[1] = fileName;
//animals[2] = ".csv";

//String filename = join(animals, "");
//  table = loadTable(filename, "header");

//  for (TableRow row : table.rows()) {
    
//    int id = row.getInt("id");
//    int dat = row.getInt("Humidity");
//    int dat2 = row.getInt("Temperature (Celcius)");
//x1 = x2;
//y1 = y2;
//y1a = y2a;
//x2 = id;
//y2 = dat;
//y2a = dat2;
//   stroke(240, 0, 0);
//   strokeWeight(1);  // Thicker
//   line(x1/100+200, 500-y1*10, x2/100+200, 500-y2*10);
//   stroke(0, 202, 200);
//   strokeWeight(1);  // Thicker
  
//   line(x1/100+200, 500-y1a*10, x2/100+200, 500-y2a*10);
//   stroke(200, 200, 200);
//  line(200, 20, 200, 320);
//  line(200, 320, 700, 320);
//  stroke(0, 0, 0);
//  line(200, 321, 200, 400);
//  for(int i = 1; i < 9; i = i+1){
//    stroke(200, 200, 200);
//   line(195, 320-60*i, 200, 320-60*i);
//   line(200+60*i, 320, 200+60*i, 325);
//  }
//  }
//x1 = 0;
//y1 = 0;
//x2 = 0;
//y2 = 0;
   

//for(int i = 0; i < 6; i = i+1){

//String[] txt2 = new String[3];
//String[] txt3 = new String[3];
//txt2[0] = BOX_ID[i]; txt2[1] = ":  "; txt2[2] = BIRD_ID[i];
//txt3[0] = "Entry Date:"; txt3[1] = ":  "; txt3[2] = ENTRY[i];
//String disptxt = join(txt2, "");
//String disptxt2 = join(txt3, "");
//if(BOXa[i] ==0){
//  fill(90, 92, 90, 94);
//}else
  
//fill(0, 102, 153, 204);
//textSize(16);
//text(disptxt, Xval[i], Yval[i]);
//text(disptxt2, Xval[i], Yval[i]+22);
////text(Timer[i], Xval[i], Yval[i]+44);
////println(BIRD_ID[i]);
//}
//delay(3000);
//save("/Users/glab/Google Drive/ARGO/IMage2.png");
 
//}