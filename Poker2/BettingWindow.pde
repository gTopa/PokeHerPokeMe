import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.concurrent.TimeUnit;

public class BettingWindow extends JFrame implements ActionListener {
  JPanel currentProperty;
  JFrame frame;
  JButton b1,b2,b3,b4;
  JTextField tf1;
  int player;
  
  public BettingWindow(int player){
    this.player=player;
    if(check){
      b1=new JButton("Check");
      b1.addActionListener(this);
      b1.setActionCommand("Check");
    }
    b2=new JButton("Call");
    b2.addActionListener(this);
    b2.setActionCommand("Call");
    b3=new JButton("Bet");
    b3.addActionListener(this);
    b3.setActionCommand("Bet");
    b4=new JButton("Fold");
    b4.addActionListener(this);
    b4.setActionCommand("Fold");
  }
  
  public void actionPerformed(ActionEvent e){
    String event = e.getActionCommand();
    if(event.equals("Bet")){
      String s = tf1.getText();
      players.get(player).bet(Integer.parseInt(s));
    }else if(event.equals("Call")){
      
    }else if(event.equals("Fold")){
      fold[player]=true;
    }
  }
}