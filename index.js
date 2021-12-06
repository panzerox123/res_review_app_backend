const express = require('express');
const { Client } = require('pg');
const app = express();
const PORT = process.env.PORT || 8000;

app.use(express.json())

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
    } catch {
        res.status(400).send();
        return;
    }
    client.end();
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
    } catch {
        res.status(403).send();
        return;
    }
    res.status(200).send(back.rows)
    client.end()
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
    } catch {
        res.status(400).send()
        return
    }
    res.status(200).send(back.rows)
    client.end()
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
    } catch(err) {
        console.log(err)
        res.status(404).send()
        return
    }
    res.status(200).send(back.rows)
    client.end()
})

app.listen(PORT, () => {
    console.log(`Server started on ${PORT}`);
})