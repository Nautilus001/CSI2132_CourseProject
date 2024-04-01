const express = require("express");
const cors = require("cors");
const app = express();
const pool = require ("./db");

//middleware//
app.use(cors());
app.use(express.json()); //req.body

//ROUTES//

app.post('/search', async (req, res) => {
    try {
        // Extract search parameters from the request body
        const { startDate, endDate, minimumCapacity, maxHotelRooms, city, hotelchain, category } = req.body;
        
        // Construct the SQL query
        const query = `
        SELECT DISTINCT R.RoomID, R.RoomNumber, R.PricePerNight, R.Capacity, R.Seaview, R.MountainView, R.Extendable, R.MaintenanceNotes
        FROM Rooms R
        INNER JOIN Hotels H ON R.HotelID = H.HotelID
        INNER JOIN HotelChains HC ON H.ChainID = HC.ChainID
        LEFT JOIN Bookings B ON R.RoomID = B.RoomID
        WHERE 
            H.NumRooms <= $1
            AND H.Category = $2
            AND R.Capacity >= $3
            AND H.HotelAddress LIKE '%' || $4 || '%'
            AND HC.ChainName = $5
            AND NOT EXISTS (
                SELECT 1
                FROM Bookings B2
                WHERE 
                    B2.RoomID = R.RoomID
                    AND (
                        ($6 BETWEEN B2.CheckinDate AND B2.CheckoutDate)
                        OR ($7 BETWEEN B2.CheckinDate AND B2.CheckoutDate)
                        OR (B2.CheckinDate BETWEEN $6 AND $7)
                    )
            )
        `;

  
        // Execute the SQL query
        const { rows } = await pool.query(query, [maxHotelRooms, category, minimumCapacity, city, hotelchain, startDate, endDate]);
    
        // Send the search results back to the client as JSON
        res.json(rows);

    } catch (error) {

        console.error('Error executing SQL query:', error);
        res.status(500).json({ error: 'An internal server error occurred' });

    }
});


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