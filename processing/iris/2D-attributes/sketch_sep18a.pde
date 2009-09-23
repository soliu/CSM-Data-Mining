PImage mapImage;
Table locationTable;
//Table dataTable;
//float dataMin = MAX_FLOAT;
//float dataMax = MIN_FLOAT;
int rowCount;
void setup(){
  size(640,400);
//  mapImage = loadImage("map.png");
  locationTable = new Table("iris.data.txt");
  rowCount = locationTable.getRowCount();
//  dataTable = new Table("random.tsv");
//  for(int row=0; row< rowCount; row++){
//    float value = dataTable.getFloat(row,1);
//    if(value > dataMax){
//      dataMax = value;
//    }
//    if(value < dataMin){
 //     dataMin = value;
//    }
//  }
}
void draw(){
  background(255);
//  image(mapImage,0,0);
  smooth();
  fill(192,0,0);
  noStroke();
  for(int row=0; row< rowCount; row++){
//    String abbrev =dataTable.getRowName(row);
    float x = locationTable.getFloat(row,1);
    float y = locationTable.getFloat(row,2);
//    drawData(x,y,abbrev);
    if(locationTable.getString(row,4).equals("Iris-setosa"))
    {
      fill(#333366);
    }
    else if(locationTable.getString(row,4).equals("Iris-versicolor"))
    {
      fill(204,102,0);
    }
    else if(locationTable.getString(row,4).equals("Iris-virginica")) 
    {
      fill(#EC5166);
    }
    ellipse(x*30,y*30,4,4);
  }
}
void drawData(float x, float y, String abbrev){
//  float value = dataTable.getFloat(abbrev,1);
//  float mapped = map(value, dataMin, dataMax, 2, 40);
//  float percent = norm(value, dataMin, dataMax);
//  color between = lerpColor(#296F34, #61E2F0,percent,HSB);
//  fill(between);
//  ellipse(x,y,15,15);
}
