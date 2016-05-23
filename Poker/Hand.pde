public class Hand{
  public ArrayList<Card> hand;
  
  public Hand(){
    hand=new ArrayList<Card>();
  }
  
  public Hand(ArrayList<Card> cards){
    hand=cards;
  }
  
  public void addCard(Card newCard, float x, float y){
    newCard.setX(x);
    newCard.setY(y);
    hand.add(newCard);
  }
  
  public Card removeCard(int index){
    return hand.remove(index);
  }
  
  public Card getCard(int index){
    return hand.get(index);
  }
  
  public String toString(){
    String str="";
    for(Card c:hand){
      str+=c+", ";
    }
    return str;
  }
  
  public void howCards(){
    
  }
}