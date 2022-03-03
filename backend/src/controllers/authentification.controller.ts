import {Request,Response} from "express";
import jwt from "jsonwebtoken";
import dotenv from "dotenv"

dotenv.config();

export class AuthentificationController{

    static async signup(req : Request,res : Response) {

        let {username, useremail, userpassword} = req.body;
        let jwt_secret_key =process.env.JWT_SECRET_KEY as string;
        jwt.sign(
            {
                useremail, //! Payload
            },
            jwt_secret_key, //! Secret key
            {
                expiresIn:"1h", //! Expiration time
            },
            async(error: any, data:any) =>{
                //! Callback
                if(error){
                    return res.send({
                        data:error,
                        authentification:false,
                    });
                }
                return res.send({
                    data:data,
                    authentification:true,

            }
        )
        
    }
}