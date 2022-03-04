import {BaseEntity, Column, Entity, PrimaryGeneratedColumn} from "typeorm";



//entity refers to the shape of you data in your database

@Entity("users")
export class UserEntity extends BaseEntity{

    @PrimaryGeneratedColumn()
    id! :string;

    @Column({
        nullable:false,
    })
    username!: string;

    @Column({
        nullable:false,
    })
    useremail!: string;

    @Column({
        nullable:false,
    })
    userpassword!: string;


}

