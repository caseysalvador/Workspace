/**
 * Created by casey on 1/28/17.
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
        while(dispenser.dispense()){
            System.out.println("Chomp!");
        }
        if (dispenser.isEmpty()){
            System.out.println("Ate all the Pez!");
        }
        dispenser.fill(4);
        dispenser.fill(2);
        while(dispenser.dispense()){
            System.out.println("Chomp!!");
        }
    }
}
