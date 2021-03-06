const express = require('express');
const cors = require('cors')
const { Client } = require('pg');
const app = express();
const PORT = process.env.PORT || 8000;

app.use(express.json())
app.use(cors())

app.post('/createCustomer', async (req, res) => {
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    //back = await client.query('SELECT * FROM Customer where customerid = 2')
    try {
        back = await client.query(`INSERT INTO login_credentials values ('${req.body['username']}', '${req.body['password']}')`);
        back = await client.query(`INSERT INTO Customer (name, emailid, phoneno, username) values ('${req.body['name']}', '${req.body['email']}', ${req.body['phoneno']}, '${req.body['username']}')`);
        client.end()
    } catch {
        res.status(400).send();
        return;
    }
    res.status(200).send();
});

app.post('/login', async (req, res) => {
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    try {
        back = await (client.query(`SELECT usertype FROM login_credentials WHERE username='${req.body['username']}' and password='${req.body['password']}'`))
        client.end()
    } catch {
        res.status(403).send();
        return;
    }
    res.status(200).send(back.rows)
})

app.post('/viewOrders', async (req, res) => {
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    try {
        back = await client.query(`SELECT * FROM ORDERS O JOIN CUSTOMER C ON O.customerid = C.customerid WHERE C.username='${req.body['username']}'`);
        client.end()
    } catch {
        res.status(400).send()
        return
    }
    res.status(200).send(back.rows)
})

app.get('/viewRestaurantReviews', async(req,res) => {
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    try {
        back = await client.query(`SELECT r.comment, r.rating, r.time_stamp, s.name, c.name from (reviews r join customer c on r.customerid=c.customerid) join restaurants s on s.restaurantid = r.restaurantid`)
        client.end()    
    } catch(err) {
        console.log(err)
        res.status(404).send()
        return
    }
    res.status(200).send(back.rows)
})

app.get('/viewAllRestaurants', async(req,res)=>{
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    try {
        back = await client.query(`SELECT * FROM restaurants`);
        client.end()
    } catch (err){
        console.log(err)
        res.status(404).send()
        return
    }
    res.status(200).send(back.rows)
})

app.post('/foodGivenRestaurant', async(req,res)=>{
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    try {
        back = await client.query(`SELECT * FROM food f JOIN restaurant_food r on f.foodid = r.foodid where r.restaurantid = ${req.body['resid']}`);
        client.end()
    } catch (err){
        console.log(err)
        res.status(404).send()
        return
    }
    res.status(200).send(back.rows)
})

app.post('/viewOrdersDelivery', async(req,res)=>{
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    try {
        back = await client.query(`SELECT * FROM (orders o JOIN delivery_personnel d ON o.personnelid = d.personnelid) JOIN login_credentials l ON l.username = d.username WHERE d.username = '${req.body.username}';`);
        client.end()
    } catch (err){
        res.status(404).send()
        return
    }
    res.status(200).send(back.rows)
})

app.post('/placeOrder', async(req,res)=>{
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err);
        } else {
            console.log('Connected to DB');
        }
    });
    try {

        var cost = 0

        for(i = 0; i < req.body.order.length; i++) {
            var back = await client.query(`SELECT price FROM food WHERE foodid = ${req.body.order[i][0]}`)
            cost = cost + back.rows[0]['price'] * parseInt(req.body.order[i][1])
        }

        const custId = await client.query(`SELECT customerid FROM customer WHERE username = '${req.body.username}'`)
        const temp = await client.query(`INSERT INTO ORDERS (cost, address, status, customerid, personnelid) values(${cost}, '${req.body.address}', 'Order placed', ${custId.rows[0]['customerid']}, 1) RETURNING *`)

        client.end()
    } catch (err){
        console.log(err)
        res.status(404).send()
        return
    }
    res.status(200).send()
})

app.listen(PORT, () => {
    console.log(`Server started on ${PORT}`);
})