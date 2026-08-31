import express from 'express';

export const app = express();

app.get('/', (req, res) => {
  res.send('Hello, World!');
});

if (process.env.npm_lifecycle_event !== 'test') {
  app.listen(3000, () => {
    console.log('Server is running on port 3000!');
  });
}
