import { Router } from "express";
import { PostController } from "../controllers/post.controller";


const postrouter = Router();

// authrouter.get("/posts", AuthentificationController.showposts);
// authrouter.post("/signup", AuthentificationController.signup);

postrouter.post("/add", PostController.addPost);

export {postrouter};
