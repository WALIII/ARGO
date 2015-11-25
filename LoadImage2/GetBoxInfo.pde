
Table table99;
int i99 = 0;
void GetBoxInfo() {



 table99 = loadTable("/Users/glab/Desktop/INPUT.txt","header, tsv");

  //println(table99.getRowCount() + " total rows in table"); 

  for (TableRow row : table99.rows()) {
  
String id = row.getString("BIRD_ID");
    int species = row.getInt("STATUS");
    String name = row.getString("BOX_ID");
    String name2 = row.getString("ENTRY");
    BOXa[i99] = species;
    BIRD_ID[i99] = id;
    BOX_ID[i99] = name;
    ENTRY[i99] = name2;
     i99 = i99+1;
    //println(species);
  }
i99 = 0;
 // print(BOXa);
  
}