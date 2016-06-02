import java.util.*;

public ArrayList<Card> deck;
public ArrayList<Hand> players;
public String mode;
public String lastKey="";
public boolean keyUsed;
public int turn;
public int[] scores;
public int[] bets;

void setup() {
  size(480, 480);
  deck=new ArrayList<Card>(52);
  populateDeck();
  shuffle();
  players=new ArrayList<Hand>();
  deal();
  mode="AskForCards";
  sortHand();
  scores=new int[players.size()];
}

void draw(){
  background(255);
  displayCards();
  if(lastKey.equals("S")){
    mode="SwapCards";
    lastKey="";
  }
  if (mode.equals("SwapCards")){
    exchangeCards();
    mode="Bet";
  }else if(mode.equals("Bet")){
    for(Hand h:players){
      h.bet();
    }
    boolean check=false;
    for(int i=1;i<players.size();i++){
      if(players.get(i-1).getBet()!=players.get(i).getBet()){
        check=true;
      }
    }
    if(check){
      mode="Score";
    }
  }else if (mode.equals("Score")){
    score();
    mode="End";
  }else if (mode.equals("End")){
    end();
  }
}
    
public void score(){
  for(int i=0;i<players.size();i++){
    scores[i]=players.get(i).howCards();
  }
  System.out.println(Arrays.toString(scores));
  mode="End"; 
}

public void end(){
  int winner=0;
  int max=0;
  for(int i=0;i<players.size();i++){
    if (scores[i]>max){
      max=scores[i];
      winner=i;
    }
  }
  fill(0);
  text("Player "+winner+" wins!", 230,240);
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
  for (int i=1; i<14; i++) {
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
      players.get(j).addCard(deck.remove(0), 70 * i + 75, pow(3,j)*100);
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
      Card temp=players.get(i).getCard(k);
      if (x<=temp.getX()+60&&x>=temp.getX()&&y<=temp.getY()+100&&y>=temp.getY()){
        players.get(i).getCard(k).setState(!players.get(i).getCard(k).getState());
      }
    }
  }
}

public void exchangeCards(){
  for(int i=0;i<players.size();i++){
    for(int k=0;k<5;k++){
      if (players.get(i).getCard(k).getState()){
        Card temp=players.get(i).getCard(k);
        Card newC=deck.remove(0);
        players.get(i).removeCard(k);
        players.get(i).addCard(newC, temp.getX(), temp.getY());
        k--;
      }
    }
  }
}

public void keyPressed() {
  keyUsed = true;
  //WASD
  if (keyCode == 83) { //S
    lastKey = "S";
  }
}

public void sortHand(){
  for(int i=0;i<players.size();i++){
    players.get(i).sort();
  }    
}