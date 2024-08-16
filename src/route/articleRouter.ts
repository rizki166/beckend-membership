import { Router } from "express";
import {
  createArticle,
  deleteArticle,
  getArticle,
  getArticles,
  updateArticle,
} from "../controllers/article";

const articleRouter = Router();
articleRouter.post("/article", createArticle);
articleRouter.get("/article", getArticles);
articleRouter.get("/article/:id", getArticle);
articleRouter.delete("/article/:id", deleteArticle);
articleRouter.put("/article/:id", updateArticle);
export default articleRouter;
