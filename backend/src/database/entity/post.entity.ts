import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";


@Entity("post")
export class PostEntity extends BaseEntity{

    @PrimaryGeneratedColumn()
    post_id!:string;  //! point s'exclamation veut dire ne peux pas etre egal a null

    @Column({
        nullable:false,
    })
    post_title!:string;

    @Column({
        type:"simple-array",
        nullable:false,
    })
    post_images!:string[];

    @Column({
        type:"time",
        default: () => "CURRENT_TIMESTAMP(6)",
        nullable:false,
    })
    post_time!:Date;


    @Column({
        type:"simple-array",
        nullable:true,
    })
    post_comments!:string[];

    @Column()
    post_likes!:number;






}