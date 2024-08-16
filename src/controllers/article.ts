import { Request, Response } from "express";
import * as userService from "../services/article";

export const createArticle = async (req: Request, res: Response) => {
  try {
    const { title, content } = req.body;
    const article = await userService.createArticle(title, content);
    res.status(201).json({
      message: "Article created successfully",
      article,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};

export const getArticle = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const article = await userService.getArticle(parseInt(id));
    res.status(200).json({
      message: "Get article success",
      article,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};

export const getArticles = async (req: Request, res: Response) => {
  try {
    const articles = await userService.getArticles();
    res.status(200).json({
      message: "Get articles success",
      articles,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};
export const updateArticle = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { title, content } = req.body;
    const article = await userService.updateArticle(
      parseInt(id),
      title,
      content
    );
    res.status(200).json({
      message: "Update article success",
      article,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};

export const deleteArticle = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const article = await userService.deleteArticle(parseInt(id));
    res.status(200).json({
      message: "Delete article success",
      article,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};
