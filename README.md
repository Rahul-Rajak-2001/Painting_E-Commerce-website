# About the Painting E-Commerce Website
The Project Contains Three Module CUSTOMER  SELLER and ADMINISTRATOR

CUSTOMER  MODULE
 In customer module customer can see all the paintings but if anyone wants to purchase a painting 
then first of all he/she must be registered there is a sign up option for that. After the successful registration the customer ID for the particular customer will be automatically generated and this will unique for each and every customer and he/she can easily login and access their dashboard. After login with their email ID and password then he/she can be able to view profile, update profile, view painting, search painting
,add to cart, view cart, update cart items, proceed to pay, view order status, and also send and receive messages from admin.

SELLER  MODULE

 In seller module if any seller wants to sell his paintings then first of all he or she must be 
registered there is a sign up option for that, After the successful registration seller can login by their email ID and password. After login seller can view own profile, update profile, add painting category, add paintings including details like image name price quantity category name, view own paintings, update paintings, view own order status and also send and receive message from admin.

ADMIN MODULE

 In admin module admin can login by their default ID and password and he or she can be able to 
view all customers, all sellers, all paintings and it can also be able to delete it and admin can also view and delete all paintings of any particular seller.Admin can manage all orders and update their order status it can send and receive messages from customer and seller and it can also view the total sell.

# ⚙️ Stripe Payment Gateway Setup (Test Mode)
If you're running this project with Stripe in test mode, make sure to do these steps before running it:

Uncomment line 11 in the StripeSessionHelper.java file.
This is needed to create the Stripe session properly.

Uncomment lines 25 to 35 in the StringUtilsTest.java file.
Path: build/web/WEB-INF/classes/src/test/java/com/stripe/util/StringUtilsTest.java
These lines are important for running the test cases related to Stripe utilities.

Uncomment line 83 in the payment.jsp file.
This enables the payment button so you can test the Stripe checkout.

📂 Technologies Used
Frontend: HTML, CSS, JavaScript
Backend: Java (JSP & Servlets)
Database: MySQL
Payment Integration: Stripe (Test Mode)
