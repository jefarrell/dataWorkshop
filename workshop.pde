//Empty array we will put values in
int[] answers;


void setup() {
  size(1280, 720);
  smooth(); 
  // **Make sure your data files are in a "data" folder within your sketch folder**
  loadData("germanyData.csv");
  //Use println to confirm you loaded data correctly
  //println(answers);
}

void draw() {
  background(255);
  //drawGraph(answers);
 //drawCircles(answers);
  drawRadialGraph(answers);
}


//Our function for loading data
void loadData(String url) {
  Table data = loadTable(url);
  answers = new int[data.getRowCount()];
  //iterate through our csv file
  for (int i=0; i < data.getRowCount(); i++) {
    //get the values from each row of the first column, add to array
    answers[i] = data.getRow(i).getInt(0);
  }
}

void drawCircles(int[] numbers) {
  //iterate through values
  for (int i = 0; i < numbers.length; i++) {
    //store actual values in variable n
    int n = numbers[i];
    //map count of values (the number of rows) to the width of the screen
    float x = map(i, 0, numbers.length, 100, width-100);
    float y = height/2;
    //map the data values to variable d, between 0-200.  This will be the size of circles
    float d = map(n, 0, max(numbers), 0, 200);
    fill(#ff6600, 150);
    noStroke();
    ellipse(x, y, d, d);
  }
}



void drawGraph(int[] numbers) {
  //iterate through values
  for (int i = 0; i < numbers.length; i++) {
    int n = numbers[i];
    float x = map(i, 0, numbers.length, 100, width-100);
    //start from bottom, due to layout of processing sketch window
    float y = height - 50;
    float w = 5; 
    //map our numbers to fit in the window, then do -map so they are oriented correctly at bottom of screen going up
    float h = -map(sqrt(n), 0, sqrt(max(numbers)), 0, height-50);
    rect(x, y, w, h);
  }
}


void drawRadialGraph(int[] numbers) {
  //iterate through values
  for (int i = 0; i < numbers.length; i++) {
    int n = numbers[i];
    float x = width/2;
    float y = height/2;
    float w = 5;
    //same idea as the bar graph h mapping
    float h = -map(n, 0, max(numbers), 0, height/2);
    //map count of values to a full circle - 0 to TAU/0 to 360 degrees.
    float r = map(i, 0, numbers.length, 0, TAU);
    //Use data values for a color variable, map them between 0-255
    float c = map(n, 0 ,max(numbers), 0, 255);
    fill(0,c,0);
    noStroke();
    
    //push matrix to actually draw our rotated graph
    pushMatrix();
    translate(x,y);
    rotate(r);
    rect(0,-20, w, h,2);
    popMatrix();
  }
}

