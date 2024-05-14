const express = require('express')
const cors=require('cors');

const { db } = require('./db/db');
const app = express()
require('dotenv').config()

const port = 3000;

const router = require('./routes/route')

app.use(express.json());
app.use(cors())
app.use(router)

const server = () => {
    db()
    app.listen(port, () => {
        console.log('listening to port:',port)
    })
}

server()
