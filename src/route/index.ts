import { Router } from "express";
import userRouter from "./userRouter";
import videoRouter from "./videoRouter";
import articleRouter from "./articleRouter";

const router = Router();
router.use("/", userRouter);
router.use("/", videoRouter);
router.use("/", articleRouter);
export default router;
