import { EntityRepository, Repository } from "typeorm";
import { UserEntity } from "../entity/user.entity";
import { Request,Response } from "express";

@EntityRepository(UserEntity)

export class UserRepository extends Repository<UserEntity>{

    async saveUserData(req:Request, res:Response){


        
    }



}
