import { Router } from "express";
import uploadMiddleware from "../middleware/upload";
import { createVideo, getVideo, getAllVideos } from "../controllers/video";

const videoRouter = Router();
videoRouter.post("/video", uploadMiddleware("url"), createVideo);
videoRouter.get("/video", getAllVideos);
videoRouter.get("/video/:id", getVideo);

export default videoRouter;
