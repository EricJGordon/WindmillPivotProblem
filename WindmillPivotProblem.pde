float degrees = 0;
int wait;
PVector currentPoint, prevPoint, nextPoint;
ArrayList<PVector> points = new ArrayList<PVector>();
boolean alreadyChosen, allowCloseSwitch;;

void setup(){
  size(700, 500);
  background(0);
  
  strokeWeight(8);
  stroke(#77CCFF);  //light blue
  
  points.add(new PVector(302, 111));  // will ultimately be randomly generated, 
  points.add(new PVector(232, 220));  // and/or option of user selecting their own
 
  points.add(new PVector(440, 282));  
  points.add(new PVector(268, 377));  
  points.add(new PVector(180, 145));  
  points.add(new PVector(330, 325));  
  points.add(new PVector(165, 285));  
  
   
    
  //ensure none colinear (using PValue.angleBetween?)

  currentPoint = nextPoint = points.get(1);
  prevPoint = null;
  wait = 0;
  alreadyChosen = false;
  allowCloseSwitch = false;
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
    
    float prevDist = 0;
    float lineLen = dist(x2, y2, x3, y3);  
    float d1 = dist(p.x, p.y, x2, y2);  
    float d2 = dist(p.x, p.y, x3, y3);  
    if(prevPoint!=null)
       prevDist = dist(prevPoint.x, prevPoint.y, x2, y2) + dist(prevPoint.x, prevPoint.y, x3, y3);  
    
    
    wait--;   
    
    boolean specialCase = false;
    
    
    //if ( p != currentPoint && d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer && !alreadyChosen && (wait <= 0 || allowCloseSwitch && p != prevPoint && d1+d2 < prevDist)) {
    if ( p != currentPoint && d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer && !alreadyChosen && wait <= 0 && p!= prevPoint) {
      //System.out.println("Prev: " + prevPoint + " vs p:" + p);
      
      
          specialCase = (allowCloseSwitch && p != prevPoint && d1+d2 < prevDist);
      
        nextPoint = p;
        prevPoint = currentPoint;
        alreadyChosen = true;
        
          if(allowCloseSwitch && wait>0){
            allowCloseSwitch = false; 
            //System.out.println("Yo");
          }else if(wait<=0){
            allowCloseSwitch = true;
            //System.out.println("HoHo");
          }else{
            //System.out.println("No change");
          }
        
        wait = 50;
    }
    //System.out.println(wait);
    if((wait <= 0 || specialCase) && alreadyChosen){
         currentPoint = nextPoint;
        System.out.print(currentPoint.x);
        System.out.println(currentPoint.y);
         wait = 280;                                                 
         alreadyChosen = false;
    }
  }
    

    
    //System.out.println(d1+d2-lineLen);
    
    /*float slope = (p.y - currentPoint.x)/(p.x - currentPoint.y);
      if( p!=currentPoint && (slope >= tan(radians(degrees)) - buffer && slope <= tan(radians(degrees)) + buffer)){
         currentPoint = p;
         System.out.println("Switching to " + p.x + ", " + p.y);
         System.out.println("Because slope = " + slope + " and tan(radians(degrees)) = " + tan(radians(degrees)));
         break;
      }*/
     
    
    strokeWeight(2);
    stroke(200, 0, 0);
    angledContinuousLine(currentPoint, degrees);
    degrees += 0.3;
}
