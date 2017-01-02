/**
 * Created by casey on 1/2/17.
 */
public class pezExample {

  public static void main(String[] args) {
      System.out.println("We are making a new PEZ Dispenser");
      System.out.printf("FUN FACT: There are %d PEZ in every dispenser %n",
              PezDispenser.MAX_PEZ);
      PezDispenser dispenser = new PezDispenser("Yoda");
      System.out.printf("The dispenser is %s %n",
              dispenser.getCharacterName());
      System.out.println("Filling the dispenser with delicious PEZ...");
      dispenser.fill();
  }
}
