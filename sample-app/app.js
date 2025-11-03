const express = require('express');
const app = express();
const port = 80;

app.get('/', (req, res) => {
  res.json({
    message: 'Hello from ECS!',
    timestamp: new Date().toISOString(),
    version: '1.0.0'
  });
});

app.get('/health', (req, res) => {
  res.json({ status: 'healthy' });
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});