/**
 * 
 */

/**
 * @author casey
 *
 */
class pezDispenser {
    public static final int MAX_PEZ = 12;
    final private String characterName;
    private int pezCount;

    // constructor same name as class
    public pezDispenser(String characterName) {
        this.characterName = characterName; // this more explicit or m (android)
        pezCount = 0;
    }
    // new method fill
    public void fill(){
      pezCount = MAX_PEZ;
    }
    
    //isEmpty method
    public boolean isEmpty(){
    	return pezCount == 0;
    }

    // get method / get the characterName
    public String getCharacterName() {
        return characterName;
    }

}
