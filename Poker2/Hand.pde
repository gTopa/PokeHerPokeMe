public class Hand{
  private ArrayList<Card> hand;
  private int bet;
  private int money;
  private JFrame frame;
  
  public Hand(){
    hand=new ArrayList<Card>();
    bet=0;
    money=1000;
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
    if(isStraight()&&isFlush()){
      score+=80000;
      score+=findMax();
    }else if(isStraight()){
      score+=40000;
      score+=findMax();
    }else if(isFlush()){
      score+=50000;
      score+=findMax();
    }else if(isPoker()){
      score+=70000;
      score+=findMost();
    }else if(isFull()){
      score+=60000;
      score+=findMost();
    }else if(isTwoPair()){
      score+=20000;
      score+=findMost();
    }else if(isThree()){
      score+=30000;
      score+=findMost();
    }else if(isPair()){
      score+=10000;
      score+=findMost();
      score+=findMax();
    }else{
      score+=findMax();
    }
    return score;
  }
  
  public ArrayList<Card> sort(){
    Card[] temp=new Card[5];
    for (int i=0;i<hand.size();i++){
      temp[i]=hand.get(i);
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
      if (!(hand.get(i-1).getNum()+1==hand.get(i).getNum()||(i==4&&hand.get(i).getNum()==13&&hand.get(0).getNum()==1))){
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
    return(hand.get(0).getNum()==hand.get(3).getNum()||hand.get(1).getNum()==hand.get(4).getNum());
  }
  
  public boolean isThree(){
    int numDiff=0;
    for(int i=1;i<5;i++){
      if(hand.get(i-1).getNum()!=hand.get(i).getNum()){
        numDiff+=1;
      }
    }
    return !(numDiff>2);
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
    int pairNum=0;
    for(int i=1;i<5;i++){
      if (hand.get(i-1).getNum()==hand.get(i).getNum()){
        if (onePair&&hand.get(i).getNum()!=pairNum){
          return true;
        }else{
          onePair=true;
          pairNum=hand.get(i).getNum();
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
    return (numDiff==1);
  }
  
  public int findMax(){
    return hand.get(4).getNum()*10+hand.get(4).getSuit();
  }
  
  public int findMost(){
    int[] num=new int[14];
    for(Card c:hand){
      num[c.getNum()]+=1;
    }
    int max=0;
    int val=0;
    for (int i=0;i<14;i++){
      if (num[i]>=max){
        max=num[i];
        val=i;
      }
    }
    return val*100;
  }
  
  public void bet(int amount){
    bet+=amount;
  }
  
  public int getBet(){
    return bet;
  }
}