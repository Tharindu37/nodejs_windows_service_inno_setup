const express = require('express')
const server = express();

server.get('/', (req, res) => {
    res.send('Hello World!');
  });


// Listen on port 3000
const port = 3000;
server.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});