const express = require("express");
const cors = require("cors");
const app = express();
const pool = require ("./db");

//middleware//
app.use(cors());
app.use(express.json()); //req.body

//ROUTES//

//create a hotel

app.post("/hotels", async (req, res) => {
    try {
        const { description } = req.body;
        const newHotel = await pool.query("INSERT INTO hotel(description) VALUES($1) RETURNING *", [description])
        res.json(newHotel.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
});

//get all hotels

app.get("/hotels", async (req, res) => {
    try {
        const allHotels = await pool.query
        ("SELECT * FROM hotel");
        res.json(allHotels.rows);
    } catch (err) {
        console.error(err.message);
    }
});


//get a hotel

app.get("/hotels/:id", async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params;
        const todo = await pool.query("SELECT * FROM hotel WHERE hotel_id = $1", [id]);
        
        res.json(todo.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
});

//update a hotel

app.put("/hotels/:id", async (req, res) => {
    try {
        console.log(req.params);
        const { id } = req.params;
        const { description } = req.body;
        const updateTodo = await pool.query("UPDATE hotel SET description = $1 WHERE hotel_id = $2", [description, id]);
        
        res.json("Hotel was updated");
    } catch (err) {
        console.error(err.message);
    }
});

//Delete a hotel

app.delete("/hotels/:id", async (req, res) => {
    try {
       const { id } = req.params;
       const deleteHotel = await pool.query("DELETE FROM hotel WHERE hotel_id = $1", [id]);
       req.json("Hotel was deleted");
    } catch (err) {
        console.error(err.message);
    }
});




app.listen(5000, () => {
    console.log("server has started on port 5000")
});