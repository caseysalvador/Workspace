import java.util.Scanner;

public class SimpleFaresTaskService {

    public static void main( String args[] ) throws Exception
    {
        //Casey Salvador
        //Dr. Buhler
        //CSCI459
        //September 28, 2015
        //We already have the format on how to choose an a zone
        //now we need to set it to to/where then output the zone to get the fare

        //TO AIRPORT
        //Ask user the airport code i.e. lga or atl
        Scanner in = new Scanner(System.in);
        System.out.print("What Airport are you flying to? ");
        String toAirport = in.nextLine();

        // call the FAA web service Airport Status web service
        // to convert airport code to state name
        String baseURL = "http://services.faa.gov/airport/status/" + toAirport + "?format=application/xml";
        String query = "";
        String resultQuery = "//State";
        String stateName = RestfulServiceSupport.queryWithXMLReturn( baseURL, query, resultQuery );
        System.out.println( "Airport code: " + toAirport + " is in the following state: " + stateName );

        // call the exist rest service to convert state name to state code
        baseURL = "http://52.26.87.189:8080/exist/rest/db/simplefares/stateZones.xml";
        query = "?_query=data(//state[@name='" + stateName + "']/@code)";
        resultQuery = "//exist:value";
        String stateCode = RestfulServiceSupport.queryWithXMLReturn( baseURL, query, resultQuery );
        System.out.println( "State name: " + stateName + " has the following code: " + stateCode );

        // call the exist rest service to convert state code to zone
        baseURL = "http://52.26.87.189:8080/exist/rest/db/simplefares/stateZones.xml";
        query = "?_query=data(//state[@code='" + stateCode + "']/../@id)";
        resultQuery = "//exist:value";
        String zoneTo = RestfulServiceSupport.queryWithXMLReturn( baseURL, query, resultQuery );
        System.out.println( "The zone for state: " + stateCode + " is: " + zoneTo );

        //------------------------------------------------------------------------------------------
        //FROM AIRPORT
        System.out.print("What Airport are you flying from? ");
        String fromAirport = in.nextLine();
        // call the FAA web service Airport Status web service
        // to convert airport code to state name
        baseURL = "http://services.faa.gov/airport/status/" + fromAirport + "?format=application/xml";
        query = "";
        resultQuery = "//State";
        String stateNameFrom = RestfulServiceSupport.queryWithXMLReturn( baseURL, query, resultQuery );
        System.out.println( "Airport code: " + fromAirport + " is in the following state: " + stateNameFrom );

        // call the exist rest service to convert state name to state code
        baseURL = "http://52.26.87.189:8080/exist/rest/db/simplefares/stateZones.xml";
        query = "?_query=data(//state[@name='" + stateNameFrom + "']/@code)";
        resultQuery = "//exist:value";
        String stateCodeFrom = RestfulServiceSupport.queryWithXMLReturn( baseURL, query, resultQuery );
        System.out.println( "State name: " + stateNameFrom + " has the following code: " + stateCodeFrom );

        // call the exist rest service to convert state code to zone
        baseURL = "http://52.26.87.189:8080/exist/rest/db/simplefares/stateZones.xml";
        query = "?_query=data(//state[@code='" + stateCodeFrom + "']/../@id)";
        resultQuery = "//exist:value";
        String zoneFrom = RestfulServiceSupport.queryWithXMLReturn( baseURL, query, resultQuery );
        System.out.println( "The zone for state: " + stateCodeFrom + " is: " + zoneFrom );
        //-----------------------------------------------------------------------------------------
        //Take in the two zones to & from and get fare
        //XPath example:
        //?_query=data(//antecedent[contains(@to,’1’) and contains(@from,’3’)]/../consequent/@fare)

        baseURL = "http://52.26.87.189:8080/exist/rest/db/simplefares/airfareRules.xml";
        query = "?_query=data(//antecedent[contains(@to,'"+ zoneTo +"') and contains(@from,'" + zoneFrom + "')]/../consequent/@fare)";
        resultQuery = "//exist:value";
        String fare = RestfulServiceSupport.queryWithXMLReturn(baseURL, query, resultQuery);
        System.out.println("The fare is $" + fare + " from zone: "+ zoneFrom + " and to zone: " + zoneTo );
    }
}
