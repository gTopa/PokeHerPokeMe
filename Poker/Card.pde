public class Card implements Displayable, Comparable<Card>{
   private int[] type;
   private float x;
   private float y;
   private boolean state;
   private boolean faceUp;
   
   public Card(int num, int suit){
     type=new int[2];
     type[0]=num;
     type[1]=suit;
     state=false;
     faceUp=true;
   }
   
   public Card(int num, int suit, float x, float y){
     type=new int[2];
     type[0]=num;
     type[1]=suit;
     this.x=x;
     this.y=y;
     state=true;
     faceUp=false;
   }
   
   public int getNum(){
     return type[0];
   }
   
   public int getSuit(){
     return type[1];
   }
   
   public String toString(){
     return ""+type[0]+" "+type[1];
   }
   
   public float getX(){
     return x;
   }
   
   public float getY(){
     return y;
   }
   
   public void setX(float x){
     this.x=x;
   }
   
   public void setY(float y){
     this.y=y;
   }
   
   public void display(){
     if (state){
       fill(255,200,200);
     }else{
       fill(0);
     }
     rectMode(CENTER);
     rect(x,y,60,100);
     if (faceUp){
       fill(255);
       text(toString(),x,y);
     }
   }
   
   public void setState(boolean state){
     this.state=state;
   }
   
   public boolean getState(){
     return state;
   }
   
   public void setSide(){
     faceUp=!faceUp;
   }
   
   public boolean getSide(){
     return faceUp;
   }
   
   public int compareTo(Card temp){
     if (type[0]*10+type[1]>temp.getNum()*10+temp.getSuit()){
       return 1;
     }else if(type[0]*10+type[1]<temp.getNum()*10+temp.getSuit()){
       return -1;
     }else{
       return 0;
     }
   }
}