import { EntityRepository, Repository } from "typeorm";
import { UserEntity } from "../entity/user.entity";
import { Request,Response } from "express";

@EntityRepository(UserEntity)

export class UserRepository extends Repository<UserEntity>{

    async saveUserData(req:Request, res:Response, hashedPassword:any){

        let {username, useremail, userimage} = req.body;

        let checkIfUserExists = (await this.createQueryBuilder("users")
        .select()
        .where("users.useremail = :useremail",{
            useremail,

        }).getCount()) > 0;

        if (checkIfUserExists) {
            return res.send({

                code : 403, //! invalid request user still exist
                authentificated :false,
                message : "User already exists"

            });
        }

        this.createQueryBuilder("users").insert().values({

            useremail,
            userpassword : hashedPassword,
            username,
            userimage,

        }).execute()

    }

    async findUserPassword(
        req:Request, 
        res:Response, 
        useremail:string,
        ) : Promise<any>{


        let getbaseuserpassword = await this.createQueryBuilder("users")
        .select("users.userpassword")
        .where("users.useremail = :useremail",{useremail})
        .getOne();

        if (getbaseuserpassword === undefined){
            return res.send({
                code : 403, //! invalid request
                message:"User not found",
                authenticated : false,
            });

        } else {
            return getbaseuserpassword;
        }

        

    }

}
