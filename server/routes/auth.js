const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const authRouter= express.Router();
//const jwt = require("jsonwebtoken");
//const auth = require("../middlewares/auth");

// Sign UP
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({
                msg: "User with same email already exists!" });
        
    }
    const hashedPassword= await bcryptjs.hash(password,8);
    // Send data to mongoDB
    let user = new User({
        email, 
        password: hashedPassword,
        name,
    });
    user = await user.save(); // send data to mongoDB and save it
    res.json(user); // print user data as json format 
}
        catch (e) {
            return res.status(500).json({ error: e.message});
        }
    
    
    });
module.exports = authRouter;