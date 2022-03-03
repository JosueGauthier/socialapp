import { Router } from "express";
import { AuthentificationController } from "../controllers/authentification.controller";


const authrouter = Router();

authrouter.get("/posts", AuthentificationController.signup);
authrouter.post("/signup", AuthentificationController.signup);

export {authrouter};
