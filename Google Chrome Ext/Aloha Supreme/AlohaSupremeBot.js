// Size
var size = "61407" //This is done by Number need to have specific Size Number

// Billing Info
var fullName = "John Smith"
var email = "smith.john@gmail.com"
var telephone = "808-123-1234"
var address = "123 Street Rd."
var zipCode = "29112"
var city = "Charleston"
var state = "SC"
var country = "USA"

// Credit Card Info
//var cardNumber = "1223223612541259"
var cardMonth = "05"
var cardYear = "2020"
var cardVerificationValue = "123"

// Autofill Item & Size
document.getElementById("s").value = size;
document.getElementsByClassName("button").click();
document.getElementsByClassName("button checkout")[0].click();

// Autofill Billing Info
document.getElementById("order_billing_name").value = fullName;
document.getElementById("order_email").value = email;
document.getElementById("order_tel").value = telephone;
document.getElementById("bo").value = address;
document.getElementById("order_billing_zip").value = zipCode;
document.getElementById("order_billing_city").value = city;
document.getElementById("order_billing_state").value = state;
document.getElementById("order_billing_country").value = country;

// Autofill Credit Card Info
//document.getElementById("nnaerb").value = cardNumber;
document.getElementById("credit_card_month").value = cardMonth;
document.getElementById("credit_card_year").value = cardYear;
document.getElementById("orcer").value = cardVerificationValue;

// Check Box & Process Payment
document.getElementsByClassName("iCheck-helper")[1].click();
document.getElementsByName("commit")[0].click();