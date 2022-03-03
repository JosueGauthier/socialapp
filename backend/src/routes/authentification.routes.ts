import { Router } from "express";
import { AuthentificationController } from "../controllers/authentification.controller";


const authrouter = Router();

authrouter.post("/signup", AuthentificationController.signup);

export {authrouter};
