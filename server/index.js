// Imports from packages
const express = require("express");
const mongoose = require("mongoose");
// const adminRouter= require("./routes/admin");

// Imports From Other Files
const authRouter = require("./routes/auth");
// const productRouter= require("./routes/product");
//const userRouter = require("./routes/user");

// Initialize
const PORT=3000;
const app = express();
const DB =
    "mongodb+srv://alpha:eroS%40%40456@cluster0.efyhx2z.mongodb.net/?retryWrites=true&w=majority";

// Middleware
app.use(express.json());
console.log( "typeof :",typeof authRouter);
console.log( "typeof :",typeof express.json());
app.use(authRouter);
// app.use(adminRouter);
// app.use(productRouter);
//app.use(userRouter);

// Connections
mongoose.connect(DB)
.then(() => {console.log("Connection Successful");
})
.catch((e) => {
    console.log(e);
});

app.listen(PORT,()=>{
    console.log(`Server is connected at port: ${PORT}`);
});

