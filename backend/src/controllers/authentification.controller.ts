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

        if(!AuthentificationController.validateEmail(useremail)){

            return res.send({

                code : 402, //! Invalid email

                authentificated :false,
                message : "Enter valid email",

            });

        }

        let salt = await bcrypt.genSalt(10);
        bcrypt.hash(userpassword,salt, async (error:any,hashedPassword:any) =>{

            //! Callback
            if(error){
                return res.send({
                    code : 401, //! General error
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
                            code : 401, //!  General error
                            message:"Something went wrong, try again",
                            authentification:false,
                        });
                    }
                    return res.send({
                        code : 201, //! request ok
                        message :data,
                        authentification:true,
    
                });
    
            }
            
                );

            
        });




        

        
        
    }

    //! Login process

    static async login(req : Request,res : Response) {

        let {useremail, userpassword} = req.body;


        let jwt_secret_key =process.env.JWT_SECRET_KEY as string;

        
        if(!AuthentificationController.validateEmail(useremail)){

            return res.send({

                authentificated :false,
                message : "Enter valid email",

            });

        }

        //! check user data
        let userRepository = getCustomRepository(UserRepository);

        
        let userdata =  await userRepository.findUserPassword(req,res,useremail);

        
        
        let basePassword = userdata!.userpassword;

        

        //! Compare passwords

        bcrypt.compare(
            userpassword,
            basePassword,
            async(error:any,result:any) =>{
                if(error){
                    console.log("\n\n ERROR \n\n");

                    return res.send({

                        code : 401,
                        message: "Something went wrong",
                        authentication : false,
    
                    });


            
                }

            if(!result){

                return res.send({


                    code : 407, //! wrong password
                    message: "Wrong password",
                    authentication : false,

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

                    console.log("sign");
                    //! Callback
                    if(error){
                        return res.send({
                            code : 401, //! generl error
                            message: error,
                            authentication:false,
                        });
                    }
                    return res.send({
                        code : 201, //! request ok
                        message :data,
                        authentication:true,
    
                });
    
            }
            
                );
            
            


        })

        

    }
}
