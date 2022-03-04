import {Request,Response} from "express";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

import * as EmailValidator from "email-validator";

dotenv.config();

export class AuthentificationController{

    static async showposts(req : Request,res : Response) {

        let jwt_secret_key =process.env.JWT_SECRET_KEY as string;

        let token = req.headers.authorization as string;
        jwt.verify(token,jwt_secret_key,async(error:any,data:any)=>{

                if(error){
                    return res.send({
                        data: error,
                        received: false,
                    });
                }
                return res.send({
                    posts:"List of Posts",
                    userdata:data,
                })
                 

            });


    }

    static validateEmail(useremail :string):boolean{

        let isEmailValid = EmailValidator.validate(useremail);
        return isEmailValid;

        

    }

    static async createNewAccount(req : Request,res : Response) {

        let {username, useremail, userpassword} = req.body;

        let jwt_secret_key =process.env.JWT_SECRET_KEY as string;

        if(!AuthentificationController.validateEmail){

            return res.send({

                authentificated :false,
                message : "Enter valid email",

            });

        }



        

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

            });

        }
        
            );
        
    }
}
