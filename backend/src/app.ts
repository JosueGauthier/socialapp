//console.log("This thing is working V");

import express from "express";
import { Connection, ConnectionOptions, createConnection } from "typeorm";
import { authrouter } from "./routes/authentification.routes";
import config from "./ormconfig"
import "reflect-metadata"

const app = express();
const port = process.env.PORT || 8000;

createConnection(config as ConnectionOptions).then(async(connection) =>{

    if (connection.isConnected){

        console.log(`🐘 is connected`);

    }

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
    });
});

