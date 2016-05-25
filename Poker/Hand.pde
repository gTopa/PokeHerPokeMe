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
  
  public int howCards(){
    int score=0;
    hand=sort();
    if(isStraight()){
      score+=3000;
    }else if(isFlush()){
      score+=4000;
    }else if(isStraight()&&isFlush()){
      score+=7000;
    }else if(isFull()){
      score+=5000;
    }else if(isPoker()){
      score+=6000;
    }else if(isThree()){
      score+=3000;
    }else if(isTwoPair()){
      score+=2000;
    }else if(isPair()){
      score+=1000;
    }
    return score;
  }
  
  public ArrayList<Card> sort(){
    Card[] temp=new Card[5];
    for (int i=0;i<hand.size();i++){
      temp[i]=hand.get(0);
    }
    Arrays.sort(temp);
    ArrayList<Card> t=new ArrayList<Card>();
    for (int i=0;i<5;i++){
      t.add(temp[i]);
    }
    return t;
  }
  
  public boolean isStraight(){
    for (int i=1;i<5;i++){
      if (!(hand.get(i-1).getNum()+1==hand.get(i).getNum()||(hand.get(i).getNum()==1&&hand.get(i-1).getNum()==13))){
        return false;
      }
    }
    return true;
  }
  
  public boolean isFlush(){
    for(int i=1;i<5;i++){
      if(hand.get(i-1).getSuit()!=hand.get(i).getSuit()){
        return false;
      }
    }
    return true;
  }
  
  public boolean isPoker(){
    boolean diff=false;
    for(int i=1;i<5;i++){
      if(hand.get(i-1).getNum()!=hand.get(i).getNum()){
        if(diff){
          return false;
        }
      }else{
        diff=true;
      }
    }
    return true;
  }
  
  public boolean isThree(){
    int numDiff=0;
    for(int i=1;i<5;i++){
      if(hand.get(i).getNum()!=hand.get(i).getNum()){
        numDiff+=1;
      }
    }
    return !(numDiff>3);
  }
  
  public boolean isPair(){
    for(int i=1;i<5;i++){
      if(hand.get(i-1).getNum()==hand.get(i).getNum()){
        return true;
      }
    }
    return false;
  }
  
  public boolean isTwoPair(){
    boolean onePair=false;
    for(int i=1;i<5;i++){
      if (hand.get(i-1).getNum()==hand.get(i).getNum()){
        if (onePair){
          return true;
        }else{
          onePair=true;
        }
      }
    }
    return false;
  }
  
  public boolean isFull(){
    int numDiff=0;
    for(int i=1;i<5;i++){
      if(hand.get(i-1).getNum()!=hand.get(i).getNum()){
        numDiff++;
      }
    }
    return (numDiff<=1);
  }
}