import java.util.*;
public ArrayList<Card> deck;
public ArrayList<Hand> players;
public ArrayList<Card> discards;
public String mode;
public String lastKey="";
public boolean keyUsed;

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
  fill(255);
  displayCards();
  if(lastKey.equals("S")){
    mode="SwapCards";
  }
  if (mode.equals("SwapCards")){
    exchangeCards();
    mode="Done";
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

public void mouseClicked(){
  select(mouseX, mouseY);
}

public void select(float x, float y){
  for(int i=0;i<players.size();i++){
    for(int k=0;k<5;k++){
      if (dist(x,y,players.get(i).getCard(k).getX(),players.get(i).getCard(k).getY())<65){
        players.get(i).getCard(k).setState("swap");
      }
    }
  }
}

public void exchangeCards(){
  for(int i=0;i<players.size();i++){
    for(int k=0;k<5;k++){
      if (players.get(i).getCard(k).getState().equals("swap")){
        Card temp=players.get(i).getCard(k);
        Card newC=deck.remove(0);
        players.get(i).removeCard(k);
        players.get(i).addCard(newC, temp.getX(), temp.getY());
      }
    }
  }
}

public void keyPressed() {
  print(keyCode+",");
  keyUsed = true;
  //WASD
  if (keyCode == 83) { //S
    lastKey = "S";
  }
}