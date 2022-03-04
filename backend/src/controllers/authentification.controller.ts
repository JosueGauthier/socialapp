import {Request,Response} from "express";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

import bcrypt from "bcrypt";

import * as EmailValidator from "email-validator";
import { getCustomRepository } from "typeorm";
import { UserRepository } from "../database/repository/user.repository";

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
                });
                 

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

        let salt = await bcrypt.genSalt(10);
        bcrypt.hash(userpassword,salt, async (error:any,hashedPassword:any) =>{

            //! Callback
            if(error){
                return res.send({
                    message:error,
                    authentification:false,
                });
            }

            //! Saving user data first
            let userRepository = getCustomRepository(UserRepository)
            await userRepository.saveUserData(req,res,hashedPassword);


            //Sending a JWT
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
                            message:error,
                            authentification:false,
                        });
                    }
                    return res.send({
                        data:data,
                        authentification:true,
    
                });
    
            }
            
                );

            
        });




        

        
        
    }

    //! Login process

    static async login(req : Request,res : Response) {

        let jwt_secret_key =process.env.JWT_SECRET_KEY as string;

        let {useremail, userpassword} = req.body;

        if(!AuthentificationController.validateEmail){

            return res.send({

                authentificated :false,
                message : "Enter valid email",

            });

        }

        //! check user data
        let userRepository = getCustomRepository(UserRepository);
        let userdata =  await userRepository.findUserPassword(req,res,useremail);
        let basePassword = userdata!.userpassword!;


        //! Compare passwords

        bcrypt.compare(userpassword,basePassword, async(error:any,result:any) =>{

            //! Callback
            if(error){
                return res.send({
                    message:error,
                    authentification:false,
                });
            }

            if(!result){

                return res.send({

                    message: "Wrong password",
                    authentification : false,

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
                            message:error,
                            authentification:false,
                        });
                    }
                    return res.send({
                        data:data,
                        authentification:true,
    
                });
    
            }
            
                );
            
            


        })

        

    }
}
