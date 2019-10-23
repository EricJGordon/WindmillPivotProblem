//array of PVectors?

void setup(){
  size(700, 500);
  background(0);
  
  //fill array with dozen or so random points
  
  strokeWeight(8);
  stroke(#77CCFF);  //light blue
  
  
  point(30, 20);  //temporary
  point(85, 20);
  point(85, 75);
  point(30, 75);
  
  //ensure none colinear (using PValue.angleBetween?)
}

void angledInfiniteLine(float x, float y, float angle){
  
  //maths to calculate x1, y1, x2, y2, where line intersects borders of window
  
  //line(x1, y1, x2, y2 );
}

void draw(){
  //increment angle
  //if line hits another pivot, switch to it
}
