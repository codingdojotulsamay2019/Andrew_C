const express = require('express')
const app = express();
app.use(express.urlencoded({extended: true}));
require('./server/config/mongoose');
require('./server/config/routes')(app);


app.listen(8000), () => console.log('listening on port 8000');
