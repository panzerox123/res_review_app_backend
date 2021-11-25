CREATE USER customer;
grant SELECT on TABLE customer, customer_addresses, orders, payments, restaurants, food, restaurant_food, food_orders, reviews, login_credentials, restaurant_phoneno, restaurant_emailid to customer;
grant INSERT on TABLE customer_addresses, orders, food_orders, customer, payments, reviews, login_credentials to customer;
grant UPDATE on TABLE customer_addresses, orders, food_orders, customer, reviews, login_credentials to customer;

CREATE USER delivery_personnel;
grant select on login_credentials, delivery_personnel, orders, restaurants, food_orders, restaurant_phoneno to delivery_personnel;
grant insert on login_credentials, delivery_personnel to delivery_personnel;
grant update on login_credentials, delivery_personnel, orders to delivery_personnel;

CREATE USER res_manager;
grant select on login_credentials, restaurant_managers, restaurant_emailid, restaurants, restaurant_phoneno, food, restaurant_food to res_manager;
grant insert on login_credentials, restaurant_managers, restaurant_emailid, restaurants, restaurant_phoneno, food, restaurant_food to res_manager;
grant update on login_credentials, restaurant_managers, restaurant_emailid, restaurants, restaurant_phoneno, food, restaurant_food to res_manager;
