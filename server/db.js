const Pool = require ("pg").Pool;

const pool = new Pool ({
    user: "postgres",
    password: "password",
    host: "localhost",
    post: 5432,
    database: "hotelapp"
});

module.exports = pool;