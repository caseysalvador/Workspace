//Created by: Casey Chad L. Salvador
//CSCI459 Dr. Buhler
//Assignment One
//September 4, 2015

import java.util.*;

public class CaseySalvadorRoundTrip
{
    public static void main(String a[]){
        
        /*
        Take in two state codes via command line and output round trip fare.

        Travel Fares                           Round-Trip Fare
        Within a zone                          $238
        Between zones 5 & 6                    $238
        Between zones 1, 2 and 3               $278
        Zone 1, 2, 3 to/from zone 4            $318
        Zone 1, 2, 3, 4 to/from zone 5 & 6     $398
        */
        //Scanner to take in user input
         Scanner in = new Scanner(System.in);
         //Created String Arrays that contain the different states within the 6 zones.
         String[] zone1 = {"AL","FL","GA","MS","NC","SC","TN"};
         String[] zone2 = {"CT","DC","DE","MA","MD","ME","MO","NJ","NY","PA","RI","VA","WV"};
         String[] zone3 = {"IA","IL","IN","KS","KY","MI","MN","MO","NE","OH","WI"};
         String[] zone4 = {"AR","LA","NM","OK","TX"};
         String[] zone5 = {"CO","ID","MT","ND","SD","UT","WY"};
         String[] zone6 = {"AZ","CA","NV","OR","WA"};
         //Created a String Array of zones to take in Arrays Zones 1-6
         String[][] zones = { zone1, zone2, zone3, zone4, zone5, zone6 };

         //Ask the user to input a state code from where they are flying from.
         System.out.print("From where are you flying from? ");
         String frm = in.nextLine();
         
        int zoneTravellingFrom = -1;
        //for loop to iterate through zones 1 - 6
        for (int i = 1; i <= 6; i++) {
            //String Array zone takes in zones. Example when i = 1, 1-1 = 0 therefore zone1 is then assigned to zone
            String[] zone = zones[i-1];
            //checks to see if state code is contained within zone.
            // Example zone1 is assigned to zone and then checks within the array if the state code is in array zone1
            if (Arrays.asList(zone).contains(frm)) {
                //re-assign variable zoneTravellingFrom to equal to i
                zoneTravellingFrom = i;
                //output the zone from which you are travelling from
                System.out.println("Flying from zone: " + zoneTravellingFrom);
            }
        }

        //Ask the user to input a state code from where they are flying to.
         System.out.print("From where are you flying to? ");
         String to = in.nextLine();
         
        int zoneTravellingTo = -1;
        //for loop to iterate through zones 1 - 6
        for (int i = 1; i <= 6; i++) {
            //String Array zone takes in zones.
            String[] zone = zones[i-1];
            //checks to see if state code is contained within zone
            if (Arrays.asList(zone).contains(to)) {
                //re-assign variable zoneTravellingTo to equal to i
                zoneTravellingTo = i;
                //output the zone from which you are travelling to
                System.out.println("Flying to zone: " + zoneTravellingTo);
            }
        }
        //Output the zones you are travelling from/to
        System.out.println("Flying from zone: " + zoneTravellingFrom + " to zone: " + zoneTravellingTo +"\n");

        //assign a variable fare as double for currency
        double fare = 0;
        //if/else statement that takes in the zone value of to/from and outputs the round-trip fare cost for the flight.
        if (zoneTravellingFrom == zoneTravellingTo)
        {
            //Travelling within the same zones
            System.out.println("Travelling within zone");
            fare = 238.00;
        }
        else if (zoneTravellingFrom >= 5 && zoneTravellingFrom <= 6 && zoneTravellingTo >= 5 && zoneTravellingTo <= 6)
        {
            //Travelling within zones 5 & 6
            System.out.println("Travelling within 5 & 6");
            fare = 238.00;
        }
        else if (zoneTravellingFrom >= 1 && zoneTravellingFrom <= 3 && zoneTravellingTo >= 1 && zoneTravellingTo <= 3)
        {
            //Travelling between zones 1 - 3
            System.out.println("Travelling between zones 1, 2 and 3");
            fare = 278.00;
        }
        else if ((zoneTravellingFrom >= 1 && zoneTravellingFrom <= 3 && zoneTravellingTo == 4) || (zoneTravellingFrom == 4 && zoneTravellingTo >= 1 && zoneTravellingTo <= 3))
        {
            //Travelling between zones to/from 1 - 4
            System.out.println("Travelling Between zone 1, 2, 3 to/from zone 4");
            fare = 318.00;
        }
        else if ((zoneTravellingFrom >= 1 && zoneTravellingFrom <= 4 && zoneTravellingTo >= 5 && zoneTravellingTo <= 6) || (zoneTravellingFrom >= 5 && zoneTravellingFrom <= 6 && zoneTravellingTo >= 1 && zoneTravellingTo <= 6))
        {
            //Travelling between zones 1-4 to/from 5 & 6
            System.out.println("Travelling between zone 1, 2, 3, 4 to/from zone 5 & 6");
            fare = 398.00;
        }
        //Output the total round-trip of the fare 
        //converted fare to output a String with 2 decimal places
        System.out.println("Your total round-trip fare is: $" + String.format("%.2f", fare));
        System.out.println("Have a wonderful flight and Thank you for choosing Delta Airlines!");
    }

}
