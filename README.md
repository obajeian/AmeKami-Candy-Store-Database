Ame Kami

Ame Kami is a confectionary enterprise that specialises in selling Japanese candy and everything sweet from Japan. 
They are opening up a new store that wants to focus on delivery of their candy.

The order data:
o	Item name 
o	Item price
o	Customer name
o	Quantity
o	Delivery address

Clear version order data:
o	Row ID
o	Order ID
o	Item Name
o	Item category
o	Item size
o	Item price
o	Quantity
o	Customer first name
o	Customer second name
o	Delivery
o	Delivery address 1
o	Delivery address 2
o	Delivery City
o	Delivery zip code

With this information I can proceed to designing the database.
Here is how our tables will look like.

1.	Order table
o	Row ID (int) PK
o	Order ID (varchar 10)
o	Created at (datetime)
o	Item ID (varchar 10)
o	Quantity (int)
o	Customer ID (int)
o	Delivery (boolean)
o	Address ID (int)

3.	Customer table
o	Customer ID (int)PK --- FK order table
o	Customer first name (varchar 50)
o	Customer last name (varchar 50)

5.	Address table
o	Address ID (int)PK --- FK order table
o	Delivery address 1 (varchar 200)
o	Delivery address 2 (varchar 200)NULL
o	Delivery City (varchar 50)
o	Delivery zip code (varchar 20)

6.	Item table
o	Item ID (varchar 10)PK --- FK order table & inventory table
o	SKU (varchar 20)
o	Item Name (varchar 50)
o	Item category (varchar 50)
o	Item size (varchar 50)
o	Item price (float)

7.	Recipe table
o	Row ID (varchar 10)PK
o	Recipe ID (varchar 20)
o	Ingredient ID (varchar 10)
o	Quantity (int)

9.	Ingredient table
o	Ingredient ID (varchar 10)PK --- FK recipe table
o	Ingredient Name (varchar 50)
o	Ingredient weight (int)
o	Ingredient measurement (varchar 20)
o	Ingredient price (float)

11.	Inventory table
o	Inventory ID (id)PK
o	Item ID (varchar 10)
o	Quantity (int)

13.	Staff table
o	Staff ID (varchar 10)PK --- FK rota table
o	Staff first name (varchar 50)
o	Staff last name (varchar 50)
o	Position (varchar 100)
o	Hourly rate (float)

15.	Rota table
o	Row ID (int)PK
o	Rota ID (varchar 20)
o	date (datetime)FK order table
o	Staff ID (varchar 20)
o	Shift ID (varchar 20)

17.	Shift table
o	Shift ID (varchar 20)PK --- FK rota table
o	Day of week (varchar 10)
o	Start time (time)
o	End time (time)

