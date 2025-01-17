// server.js
// A simple Node.js + Express server with an endpoint that streams data.

const express = require('express');
const app = express();
const port = 3000;

// Example route that streams Fibonacci numbers up to some limit
app.get('/stream-fib', (req, res) => {
  res.setHeader('Content-Type', 'text/plain');

  let n = parseInt(req.query.n, 10) || 10;
  let a = 0, b = 1;
  
  // We'll send lines as a "streaming" text response
  res.write(`Fibonacci Stream up to fib(${n}):\n`);

  // Stream the Fibonacci sequence
  for (let i = 0; i <= n; i++) {
    if (i === 0) {
      res.write(`${a}\n`);
    } else if (i === 1) {
      res.write(`${b}\n`);
    } else {
      const temp = a + b;
      a = b;
      b = temp;
      res.write(`${b}\n`);
    }
  }

  // End the response
  res.end('--- Stream End ---\n');
});

// Serve static files from the frontend folder
// (If you want your "index.html" available at http://localhost:3000/)
app.use(express.static('../frontend'));

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});

// installs express: npm install
// runs node server.js: npm start
// stream example: http://localhost:3000/stream-fib?n=10