const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

const words = [
  {
    "id": 1,
    "word": "Apple",
    "meaning": "A fruit",
    "translation": "Manzana"
  },
  {
    "id": 2,
    "word": "Beautiful",
    "meaning": "Pleasing to look at",
    "translation": "Hermosa"
  },
  {
    "id": 3,
    "word": "Friend",
    "meaning": "A person you like",
    "translation": "Amigo"
  }
];

app.get('/words', (req, res) => {
  res.json(words);
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
