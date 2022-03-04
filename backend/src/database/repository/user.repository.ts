import { EntityRepository, Repository } from "typeorm";
import { UserEntity } from "../entity/user.entity";
import { Request,Response } from "express";

@EntityRepository(UserEntity)

export class UserRepository extends Repository<UserEntity>{

    async saveUserData(req:Request, res:Response){

        let {username, useremail, userpassword} = req.body;

        let checkIfUserExists = (await this.createQueryBuilder("users")
        .select()
        .where("users.useremail = :useremail",{
            useremail,

        }).getCount()) > 0;

        if (checkIfUserExists) {
            return res.send({

                authentificated :false,
                message : "User already exists"

            });
        }

        this.createQueryBuilder("users").insert().values({

            useremail,
            userpassword,
            username,

        }).execute()





    }



}