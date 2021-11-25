const express = require('express');
const {Client} = require('pg');
const app = express();
const PORT = process.env.PORT || 8000;

app.use(express.json())

app.post('/createCustomer', async (req,res) => {
    console.log(req.body);
    client = new Client();
    client.connect(err => {
        if (err) {
            console.error(err)
        } else {
            console.log('Connected to DB')
        }
    });
    back = await client.query('SELECT * FROM Customer where customerid = 2')
    console.log(back['rows'])
    client.end();
    res.status(200).send("hello world");
}); 

app.listen(PORT, () => {
    console.log(`Server started on ${PORT}`);
})