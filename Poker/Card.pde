public class Card implements Displayable, Comparable<Card>{
   private int[] type;
   private float x;
   private float y;
   private boolean state;
   
   public Card(int num, int suit){
     type=new int[2];
     type[0]=num;
     type[1]=suit;
     state=false;
   }
   
   public Card(int num, int suit, float x, float y){
     type=new int[2];
     type[0]=num;
     type[1]=suit;
     this.x=x;
     this.y=y;
     state=false;
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
     fill(0);
     rectMode(CENTER);
     rect(x,y,60,100);
     fill(255);
     text(toString(),x,y);
   }
   
   public void setState(boolean state){
     this.state=state;
   }
   
   public boolean getState(){
     return state;
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