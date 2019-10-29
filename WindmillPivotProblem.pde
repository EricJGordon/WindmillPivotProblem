float degrees = 100;
int cooldown = 0;
PVector currentPoint, prev;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(700, 500);
  background(0);
  
  strokeWeight(8);
  stroke(#77CCFF);  //light blue
  
  points.add(new PVector(345, 120));  // will ultimately be randomly generated, 
  points.add(new PVector(230, 220));  // and/or option of user selecting their own
  points.add(new PVector(415, 275));  
  points.add(new PVector(230, 275));  
  points.add(new PVector(330, 295));  
    
  //ensure none colinear (using PValue.angleBetween?)

  currentPoint = points.get(0);
  prev = points.get(1);
  cooldown = 0;

}

void angledContinuousLine(PVector p, float angle){
  
  float segmentLength = (float)Math.sqrt(700*700+500*500);
  float x1 = p.x, y1 = p.y, x2, y2, x3, y3;
  
  x2 = x1 + cos(radians(angle))*segmentLength;
  y2 = y1 + sin(radians(angle))*segmentLength;
  x3 = x1 + cos(radians(angle+180))*segmentLength;
  y3 = y1 + sin(radians(angle+180))*segmentLength;
  
  line(x1, y1, x2, y2);
  line(x1, y1, x3, y3);
}

void draw(){
  

    background(0);
    strokeWeight(8);
    stroke(#77CCFF);  //light blue
    
    for(PVector p: points){
      point(p.x, p.y); 
    } 
    
    
  //increment angle
  //if line hits another pivot, switch to it, i.e. change currentPoint
  
  float buffer = 0.15;
  
  float segmentLength = (float)Math.sqrt(700*700+500*500);
  float x2, y2, x3, y3;
  
    for(PVector p: points){
    
    x2 = currentPoint.x + cos(radians(degrees))*segmentLength;
    y2 = currentPoint.y + sin(radians(degrees))*segmentLength;
    x3 = currentPoint.x + cos(radians(degrees+180))*segmentLength;
    y3 = currentPoint.y + sin(radians(degrees+180))*segmentLength;
      
    float lineLen = dist(x2, y2, x3, y3);  
    float d1 = dist(p.x, p.y, x2, y2);  
    float d2 = dist(p.x, p.y, x3, y3);  
       
    cooldown--;   
    if ( p != currentPoint && d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer && cooldown <= 0) {
      System.out.println("Prev: " + prev + " vs p:" + p);
      //prev = currentPoint;
      currentPoint = p;
      cooldown = 300;
    }
    
    //System.out.println(d1+d2-lineLen);
    
    /*float slope = (p.y - currentPoint.x)/(p.x - currentPoint.y);
      if( p!=currentPoint && (slope >= tan(radians(degrees)) - buffer && slope <= tan(radians(degrees)) + buffer)){
         currentPoint = p;
         System.out.println("Switching to " + p.x + ", " + p.y);
         System.out.println("Because slope = " + slope + " and tan(radians(degrees)) = " + tan(radians(degrees)));
         break;
      }*/
    } 
    
    strokeWeight(3);
    //stroke(degrees%200+50);
    stroke(200);
    angledContinuousLine(currentPoint, degrees);
    degrees += 0.3;
  
  //increment angle
  //if line hits another pivot, switch to it, i.e. change currentPoint
  
  
  
}
