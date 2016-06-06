import java.util.*;
import java.net.*;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.FileOutputStream;
import java.io.PrintStream;

public ArrayList<Card> deck;
public ArrayList<Hand> players;
public String mode;
public String lastKey="";
public boolean keyUsed;
public int turn;
public int[] scores;

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
    mode="Score";
  }else if (mode.equals("Score")){
    score();
    mode="End";
  }else if (mode.equals("End")){
    end();
  }
}
    
public void score(){
  try{
  for(int i=0;i<players.size();i++){
    scores[i]=players.get(i).howCards();
  }
  System.out.println(Arrays.toString(scores));
  mode="End"; 
  recordScores();
  }
  catch(Exception e){
  }
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
  text("Player "+(1 + winner)+" wins!", 230,240);
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

public void populateDeck(){
  try{
    for(int k=0;k<getPlayers();k+=2){
      for (int i=1; i<14; i++) {
        for (int j=0; j<4; j++) {
          deck.add(new Card(i, j));
        }
      }
    }
  String output = "";
  for (int i = 0; i < getPlayers(); i++){
    output += ("Player_"+i+":---|-\n");
  }
  sendData(output);
  }
  catch(Exception e){
    e.printStackTrace();
  }
}

public void deal() {
  for(int i=0;i<getPlayers();i++){
    players.add(new Hand());
  }
  for(int i=0;i<5;i++){
    for(int j=0;j<players.size();j++){
      players.get(j).addCard(deck.remove(0), 70 * i + 75, 200);
    }
  }
}

public void displayCards(){
  try{
  for(Hand h:players){
    for (int i=0;i<5;i++){
      h.getCard(i).display();
    }
  }
  }
  catch(Exception e){}
}

public int getPlayers(){
  ArrayList<String> l = receiveData();
  int output = l.size();
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

public void recordScores()throws Exception {
  ArrayList<String> data = receiveData();
  for (int i = 0; i < scores.length;i++){
    data.set(i,"Player_"+i+":"+scores[i]+"|-");
  }
  String output = "";
  for (int i = 0; i < data.size(); i++){
    output += data.get(i) + "\n";
  }
  sendData(output);
}
    
  
public static void sendData(String data) throws Exception {
        URL  url = new URL("ftp://b24_18266763:GioIsGreat@ftp.byethost24.com/htdocs/text.txt;type=i");
        URLConnection urlc = url.openConnection();
        OutputStream os = urlc.getOutputStream();
        OutputStream buffer = new BufferedOutputStream(os);
        PrintStream output = new PrintStream(buffer);
        output.print(data);
        
        buffer.close();
        os.close();
        output.close();
    
    }
   
   public static ArrayList<String> receiveData() throws Exception {
        ArrayList<String> output = new ArrayList<String>();
        URL oracle = new URL("ftp://b24_18266763:GioIsGreat@ftp.byethost24.com/htdocs/text.txt");
        URLConnection yc = oracle.openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
        String inputLine;
        while ((inputLine = in.readLine()) != null) 
            output.add(inputLine);
        in.close();
        return output;
    }  