//console.log("This thing is working V");

import express from "express";
import { authrouter } from "./routes/authentification.routes";

const app = express();
const port = process.env.PORT || 8000;

app.set("port",port);
app.use(express.json());
app.use(express.urlencoded({extended:false}));

app.use("/user",authrouter);

app.get("/", (req,res) =>{

    res.send({
        data: "the social rebuild API"
    });

});

app.listen(app.get("port"), () => {
    console.log(`🚀 is rocking over http://localhost:${app.get("port")}`);

})
