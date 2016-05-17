public class Card{
   private int[] type;
   
   public Card(int num, int suit){
     type=new int[2];
     type[0]=num;
     type[1]=suit;
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
}