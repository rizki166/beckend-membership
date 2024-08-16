import { Request, Response } from "express";

import * as videoService from "../services/VideoService";
export const createVideo = async (req: Request, res: Response) => {
  try {
    const { body, file } = req;
    console.log(file);
    console.log(body);

    if (!file) {
      return res.status(400).json({
        message: "No file uploaded",
      });
    }

    const video = await videoService.createVideo(
      body,
      file as Express.Multer.File
    );

    res.status(201).json({
      message: "Video created successfully",
      video,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message || "An error occurred",
    });
  }
};

export const getVideo = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const videos = videoService.getVideo(parseInt(id));
    res.status(200).json({
      message: "Get video success",
      videos,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};

export const getAllVideos = async (req: Request, res: Response) => {
  try {
    const videos = await videoService.getVideos();
    return res.status(200).json({
      message: "Get videos success",
      videos,
    });
  } catch (error: any) {
    res.status(500).json({
      message: "Failed to get videos",
      error: error.message,
    });
  }
};
export const updateVideo = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { url, title, description } = req.body;
    const video = videoService.updateVideo(
      parseInt(id),
      url,
      title,
      description
    );
    res.status(200).json({
      message: "Update video success",
      video,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};

export const deleteVideo = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const video = videoService.deleteVideo(parseInt(id));
    res.status(200).json({
      message: "Delete video success",
      video,
    });
  } catch (error: any) {
    res.status(500).json({
      message: error.message,
    });
  }
};
