/**
 * Created by casey on 1/2/17.
 */

class PezDispenser {
    public static final int MAX_PEZ = 12;
    final private String characterName;
    private int pezCount;

    // constructor same name as class
    public PezDispenser(String characterName) {
        this.characterName = characterName; // this more explicit or m (android)
        pezCount = 0;
    }
    // new method fill
    public void fill(){
      pezCount = MAX_PEZ;
    }

    // method scope
    public String getCharacterName() { //getter gets the characterName
        return characterName;
    }

}
