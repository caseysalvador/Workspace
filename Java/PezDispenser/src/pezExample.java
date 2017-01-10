/**
 * 
 */

/**
 * @author casey
 *
 */
public class pezExample {

  public static void main(String[] args) {
      System.out.println("We are making a new PEZ Dispenser");
      System.out.printf("FUN FACT: There are %d PEZ in every dispenser %n",
              pezDispenser.MAX_PEZ);
      pezDispenser dispenser = new pezDispenser("Yoda");
      System.out.printf("The dispenser is %s %n",
              dispenser.getCharacterName());
      if (dispenser.isEmpty()){
    	  System.out.println("Dispenser is empty");
      }
      System.out.println("Filling the dispenser with delicious PEZ...");
      dispenser.fill();
      if (!dispenser.isEmpty()) {
    	  System.out.println("Dispenser is full");
      }
  }
}