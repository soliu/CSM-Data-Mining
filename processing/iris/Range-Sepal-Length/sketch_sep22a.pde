FloatTable data;
float dataMin, dataMax;

float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;
int volumeInterval=1;
int rowCount;
int columnCount;
int currentColumn = 0;

String[] classes;
PFont plotFont; 
float volumeIntervalMinor = 0.5;   

void setup() {
  size(720, 405);
  
  data = new FloatTable("iris.data.txt");
  rowCount = data.getRowCount();
  columnCount = data.getColumnCount(); 
  classes = data.getRowNames();
  plotX1 = 120; 
  plotX2 = width - 80;
  labelX = 50;
  plotY1 = 60;
  plotY2 = height - 70;
  labelY = height - 25;
  
  float plotW = plotX2 - plotX1;
  
  plotFont = createFont("SansSerif", 20);
  textFont(plotFont);

  smooth();
}


void draw() {
  background(255);
  drawTitle();
//  drawAxisLabels();
  noStroke();
  fill(192,0,0);
  drawDataBars(currentColumn);
  drawRangeLabels();
  drawClassLabels();
}


void drawTitle() {
  fill(0);
  textSize(20);
  textAlign(LEFT);
  String title = "Range of Sepal Length";
  text(title, plotX1, plotY1 - 10);
}

void drawClassLabels() {
  fill(0);
  textSize(10);
  textAlign(CENTER);
  
  // Use thin, gray lines to draw the grid
  stroke(255);
  strokeWeight(1);
      text("Iris-setosa", (plotX2-plotX1)/4, plotY2 + textAscent() + 10);
      text("Iris-versicolor", (plotX2-plotX1)/2, plotY2 + textAscent() + 10);
      text("Iris-virginica", 3*(plotX2-plotX1)/4, plotY2 + textAscent() + 10);
      //line(x, plotY1, x, plotY2);
}
void drawRangeLabels() {
  fill(0);
  textSize(10);
  textAlign(RIGHT);
  
  stroke(128);
  strokeWeight(1);
  dataMin=0;
  dataMax=3;
  for (float v = dataMin; v <= dataMax; v += volumeIntervalMinor) {
    if (v % volumeIntervalMinor == 0) {     // If a tick mark
      float y = map(v, dataMin, dataMax, plotY2, plotY1);  
      if (v % volumeInterval == 0) {        // If a major tick mark
        float textOffset = textAscent()/2;  // Center vertically
        if (v == dataMin) {
          textOffset = 0;                   // Align by the bottom
        } else if (v == dataMax) {
          textOffset = textAscent();        // Align by the top
        }
        text(floor(v), plotX1 - 10, y + textOffset);
        line(plotX1 - 4, y, plotX1, y);     // Draw major tick
      } else {
        //line(plotX1 - 2, y, plotX1, y);     // Draw minor tick
      }
    }
  }
}


float barWidth = 16;  // Add this line above setup()

void drawDataBars(int col) {
  noStroke();
  rectMode(CORNERS);
  dataMin = data.getColumnMin(col);
  dataMax = data.getColumnMax(col);  
  float range = 0.0, value = 0.0, maxv = 0.0, minv = 0.0, bar = 0.0, x = 0.0, y = 0.0 ;
  int type = 0;
  String classname="";
  String prevname = data.getRowName(0);
  minv = data.getFloat(0,0);
  for (int row = 0; row < rowCount; row++) {
    if (data.isValid(row, col)) {
      value = data.getFloat(row, col);
      classname = data.getRowName(row);
      if(prevname.equals(classname))
      {
        if(maxv<value)
          maxv=value;
        if(minv>value)
          minv = value;
      }
      else
      {
        range = maxv - minv;  
        x = map(type, 0, 4, plotX1, plotX2);
        y = map(range, 0, 3, plotY2, plotY1);
        rect(x-barWidth/2, y, x+barWidth/2, plotY2);
        maxv = 0.0;   
        minv = data.getFloat(row,col);
        type++;
      } 
      prevname = classname;
    }

  }
    range = maxv - minv;;  
    x = map(type, 0, 4, plotX1, plotX2);
    y = map(range, 0, 3, plotY2, plotY1);
    rect(x-barWidth/2, y, x+barWidth/2, plotY2);
}






