// Necessary imports initialization
const express = require('express');
const cors = require('cors');
const app = express();

//  CORS - workaround, in dev mode only, will be using nginx in prod
app.use(cors({
    origin: "*",
}), express.static('public'));

// Server port
const port = 3000

// Run our server on desired port
app.listen(port, () => {
    console.log("Listening on port: ", port)
})