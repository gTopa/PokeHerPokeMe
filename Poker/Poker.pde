import java.util.*;
public ArrayList<Card> deck;
public ArrayList<Card> hand1;
public ArrayList<Card> hand2;
public ArrayList<Card> discards;

void setup() {
  size(480, 480);
  populateDeck();
  System.out.println(Arrays.toString(deck.toArray()));
  shuffle();
  hand1=new ArrayList<Card>(5);
  hand2=new ArrayList<Card>(5);
}

void draw() {
  
}  

public void shuffle(){
  for (int i=0;i<1000;i++){
    swap((int)(Math.random()*52),(int)(Math.random()*52));
  }
}

public void swap(int i, int j){
  Card temp=deck.get(i);
  deck.set(i,deck.get(j));
  deck[j]=temp;
}

public void populateDeck(){
  for (int i=0;i<13;i++){
    for(int j=0;j<4;j++){
      deck.add(new Card(i,j));
    }
  }
}