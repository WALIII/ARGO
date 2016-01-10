

String[] FolderPaths = {"Volumes/ARGO_DATA/BOX01","Volumes/ARGO_DATA/BOX02","Volumes/ARGO_DATA/BOX03","Volumes/AEOLUS_DATA/BOX04","Volumes/AEOLUS_DATA/BOX05","Volumes/AEOLUS_DATA/BOX06"};
String[] DirStem = {"Volumes/ARGO_DATA/","Volumes/AEOLUS_DATA/"};
int[] X = {0,0,0,0,0,0};
int[] Fnum = {10,30,90,100,19,30};
void setup() {
  size(800,400);
   background(0, 0, 0);
   
   //
//for(int i = 1; i < 7; i = i+1){
//  if(i<3){
//  Dir1 = Dirstem[0];
//  else
//  Dir1 = Dirstem[1];
//  }
//// Build Filename:  
//String[] animals = new String[3];
//animals[0] = Dir1;
//animals[1] = FolderNames;
//String filename = join(animals, "");
 
  // have a look in the data folder
for(int i = 0; i < 7; i = i+1){
java.io.File folder = new java.io.File(dataPath(FolderPaths[i]));
// this is the filter (returns true if file's extension is .jpg)
    java.io.FilenameFilter jpgFilter = new java.io.FilenameFilter() {  
    public boolean accept(File dir, String name) {
      return name.toLowerCase().endsWith(".jpg");
    }
  };
  
String[] filenames = folder.list(jpgFilter);  

println(filenames.length + " jpg files in specified directory");
X[i] = filenames.length;
// print the filenames, might be usefull
// for (int i = 0; i < filenames.length; i++) println(filenames[i]);
}
 }


void draw() {
  
  
  //

  //
  
  background(0, 0, 0);

  for(int i = 0; i < 6; i = i+1){
   stroke(240, 0, 0);
   strokeWeight(40);  // Thicker
   strokeCap(SQUARE);
   line(230+60*i, 320, 230+60*i, 320-X-20*i);
  }
   
   
   
   strokeWeight(1);  // Thicker
   
   
   
   stroke(200, 200, 200);
  line(200, 20, 200, 320);
  line(200, 320, 600, 320);
  stroke(0, 0, 0);
  line(200, 321, 200, 400);
  for(int i = 1; i < 7; i = i+1){
    stroke(200, 200, 200);
   line(195, 320-60*i, 200, 320-60*i);
   line(200+60*i, 320, 200+60*i, 325);
  }
  delay(1000);
}