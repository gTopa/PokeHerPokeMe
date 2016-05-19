import java.util.*;
public ArrayList<Card> deck;
public ArrayList<Hand> players;
public ArrayList<Card> discards;
public String mode;

void setup() {
  size(480, 480);
  deck=new ArrayList<Card>(52);
  populateDeck();
  shuffle();
  players=new ArrayList<Hand>();
  deal();
  for(Hand h:players){
    System.out.println(h);
  }
  mode="AskForCards";
  System.out.println(players.size());
}

void draw(){
  if (mode.equals("AskForCards")){
    displayCards();
  }
}

public void shuffle() {
  for (int i=0; i<1000; i++) {
    swap((int)(Math.random()*52), (int)(Math.random()*52));
  }
}

public void swap(int i, int j) {
  Card temp=deck.get(i);
  deck.set(i, deck.get(j));
  deck.set(j, temp);
}

public void populateDeck() {
  for (int i=0; i<13; i++) {
    for (int j=0; j<4; j++) {
      deck.add(new Card(i, j));
    }
  }
}

public void deal() {
  for(int i=0;i<2;i++){
    players.add(new Hand());
  }
  for(int i=0;i<5;i++){
    for(int j=0;j<2;j++){
      players.get(j).addCard(deck.remove(0), 70 * i + 100, pow(4,j)*100);
    }
  }
}

public void displayCards(){
  for(Hand h:players){
    for (int i=0;i<5;i++){
      h.getCard(i).display();
    }
  }
}