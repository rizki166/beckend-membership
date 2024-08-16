import { MembershipType } from "@prisma/client";
import prisma from "../db";
import { IVideo } from "../types/app";

export const getVideos = async () => {
  try {
    const videos = await prisma.video.findMany({});
    console.log("Videos fetched: ", videos);
    return videos;
  } catch (error) {
    console.error("Error during getVideos:", error);
    throw error;
  }
};

export const getVideo = async (id: number) => {
  try {
    const video = await prisma.video.findUnique({
      where: {
        id,
      },
    });
    return video;
  } catch (error) {
    console.error("Error during getVideo:", error);
    throw error;
  }
};

export const createVideo = async (
  payload: IVideo,
  file: Express.Multer.File
) => {
  if (file) {
    payload.url = file.filename;
  }

  try {
    const video = await prisma.video.create({
      data: {
        ...payload,
      },
    });

    return video;
  } catch (error) {
    console.error("Error during createVideoService:", error);
    throw new Error("Unable to create video");
  }
};
export const updateVideo = async (
  id: number,
  title: string,
  url: string,
  description: string
) => {
  try {
    const video = await prisma.video.update({
      where: { id },
      data: {
        title,
        url,
        description,
      },
    });
    return video;
  } catch (error) {
    console.error("Error during updateVideo:", error);
    throw error;
  }
};

export const deleteVideo = async (id: number) => {
  try {
    const video = await prisma.video.delete({
      where: { id },
    });
    return video;
  } catch (error) {
    console.error("Error during deleteVideo:", error);
    throw error;
  }
};
