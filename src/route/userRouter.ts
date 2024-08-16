import { Router } from "express";
import {
  getUser,
  getUsers,
  login,
  register,
  updateUser,
} from "../controllers/userController";
import authentication from "../middleware/authentications";
const userRouter = Router();

userRouter.post("/login", login);
userRouter.post("/register", register);
userRouter.get("/users", getUsers);
userRouter.get("/users/:id", getUser);
userRouter.put("/users/:id", authentication, updateUser);
export default userRouter;
