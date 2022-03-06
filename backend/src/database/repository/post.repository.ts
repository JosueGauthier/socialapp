

import { Request,Response } from "express";
import { EntityRepository, Repository } from "typeorm";
import { PostEntity } from "../entity/post.entity";

@EntityRepository(PostEntity)
export class PostRepository extends Repository<PostEntity>{

    async addPost(req :Request,res :Response){
        let {post_title,post_images,post_comments,post_likes} = req.body;


        await this.createQueryBuilder("post").insert().values({

            post_title,post_images,post_comments,post_likes,   

        }).execute().then((data:any) => {

            if (data!== undefined){

                return res.send({
                    code :201,
                    added:true,
                });
            }

            



        }).catch((error:any) => {

            if(error){
                console.log(error);
                return res.send({
                    code :401,
                    added:false,
                });
            }


        })

    }



}