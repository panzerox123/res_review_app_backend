
DROP DATABASE RES_REVIEW_APP;
CREATE DATABASE RES_REVIEW_APP;

\c res_review_app

CREATE TABLE Login_Credentials(
    username varchar(64), 
    password varchar(256) NOT NULL, 
    userType varchar(16) default 'customer', 
    primary key(username)
    );

CREATE TABLE Customer(
    customerID serial, 
    name varchar(64) NOT NULL, 
    emailID varchar(256) NOT NULL, 
    phoneNo numeric(10) NOT NULL, 
    username varchar(64) NOT NULL, 
    primary key(customerID), 
    foreign key(username) references Login_Credentials(username)
    );

CREATE TABLE Customer_Addresses(
    customerID int, 
    address varchar(256), 
    primary key(customerID, address), 
    foreign key(customerID) references Customer(customerID)
    );

CREATE TABLE Coupons(
    couponID serial, 
    discount int check(discount <= 75 and discount > 0) NOT NULL, 
    primary key(couponID)
    );

CREATE TABLE Delivery_Personnel(
    personnelID serial, 
    name varchar(32) NOT NULL, 
    emailID varchar(256) NOT NULL, 
    vehicleNo varchar(16), 
    phoneNo numeric(10) NOT NULL, 
    commission int check(commission < 25 and commission > 0) default 5, 
    location varchar(32) NOT NULL, 
    rating int check(rating <= 5 and rating > 0) default 5, 
    username varchar(64) NOT NULL, 
    primary key(personnelID), 
    foreign key(username) references Login_Credentials(username)
    );

CREATE TABLE Orders(
    orderID serial, 
    cost int NOT NULL, 
    address varchar(256), 
    status varchar(16) default 'Order placed', 
    customerID int NOT NULL, 
    couponID int, 
    personnelID int, 
    primary key(orderID), 
    foreign key(customerID) references Customer(customerID), 
    foreign key(couponID) references Coupons(couponID), 
    foreign key(personnelID) references Delivery_Personnel(personnelID)
    );

CREATE TABLE Payments(
    paymentID serial, 
    method varchar(32) NOT NULL, 
    cardNo numeric(16), 
    time_stamp timestamp NOT NULL, 
    finalPrice int NOT NULL, 
    orderID int NOT NULL, 
    primary key(paymentID), 
    foreign key(orderID) references Orders(orderID)
    );

CREATE TABLE Restaurant_Managers(
    emailID varchar(256), 
    name varchar(64) NOT NULL, 
    username varchar(64) NOT NULL, 
    primary key(emailID), 
    foreign key(username) references Login_Credentials(username)
    );

CREATE TABLE Restaurants(
    restaurantID serial,
    name varchar(64) NOT NULL, 
    rating int check(rating<=5 and rating > 0) default 5, 
    address varchar(256) NOT NULL, 
    manager_email varchar(256) NOT NULL, 
    primary key(restaurantID), 
    foreign key(manager_email) references Restaurant_Managers(emailID)
    );

CREATE TABLE Food(
    foodID serial, 
    name varchar(32) NOT NULL, 
    cuisine varchar(32), 
    category varchar(32) NOT NULL, 
    price int check(price > 0) NOT NULL, 
    primary key(foodID)
    );

CREATE TABLE Food_Orders(
    foodID int, 
    orderID int, 
    quantity int check(quantity > 0) default 1, 
    primary key(foodID, orderID), 
    foreign key(foodID) references Food(foodID), 
    foreign key(orderID) references Orders(orderID)
    );

CREATE TABLE Restaurant_Food(
    restaurantID int, 
    foodID int, 
    primary key(restaurantID, foodID), 
    foreign key(restaurantID) references Restaurants, 
    foreign key(foodID) references Food(foodID)
    );

CREATE TABLE Restaurant_PhoneNo(
    restaurantID int, 
    phoneNo numeric(10), 
    primary key(restaurantID, phoneNo), 
    foreign key(restaurantID) references Restaurants(restaurantID)
    );

CREATE TABLE Restaurant_EmailID(
    restaurantID int, 
    emailID varchar(256), 
    primary key(restaurantID, emailID), 
    foreign key(restaurantID) references Restaurants(restaurantID)
    );

CREATE TABLE Reviews(
    reviewID serial, 
    comment varchar(1024), 
    rating int check(rating <= 5 and rating > 0) default 5, 
    time_stamp timestamp, 
    customerID int NOT NULL, 
    restaurantID int, 
    personnelID int, 
    primary key(reviewID), 
    foreign key(customerID) references Customer(customerID), 
    foreign key(restaurantID) references Restaurants(restaurantID), 
    foreign key(personnelID) references Delivery_Personnel(personnelID)
    );
