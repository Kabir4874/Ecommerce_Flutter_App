const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const { dbConnect } = require("./utils/db");
const app = express();

dotenv.config();
const port = process.env.PORT || 8800;

app.use(bodyParser.json());

const { Schema, model } = mongoose;
const userSchema = new Schema({
  name: String,
  age: Number,
  email: String,
});
const User = model("User", userSchema);

dbConnect();

app.delete("/:id", async (req, res) => {
  const id = req.params.id;
  try {
    const user = await User.findByIdAndDelete(id);
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    res.json("Delete successfully");
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error deleting user", error: error.message });
  }
});

app.listen(port, () => {
  console.log(`Server is running on :${port}`);
});
