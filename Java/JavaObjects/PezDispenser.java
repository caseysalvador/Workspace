/**
 * Created by casey on 1/2/17.
 */

class PezDispenser {
    final private String characterName;

    // constructor same name as class
    public PezDispenser(String characterName) {
        this.characterName = characterName; // this more explicit or m (android)
    }

    // method scope
    public String getCharacterName() { //getter gets the characterName
        return characterName;
    }

}
