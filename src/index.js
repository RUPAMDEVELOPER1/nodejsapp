require('dotenv').config();
const express = require('express');
const productRoutes = require('./routes/productRoute');


const app = express();
const PORT = process.env.PORT || 3000

// Middleware to parse JSON bodies
app.use(express.json());

// A simple root route for testing connection
app.get('/', (req, res) => {
  res.send('Product API is running!');
});

// Use the product routes for any requests to /api/products
app.use('/api/products', productRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});