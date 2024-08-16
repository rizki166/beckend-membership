import prisma from "../db";

export const createArticle = async (title: string, content: string) => {
  try {
    const article = await prisma.article.create({
      data: {
        title,
        content,
      },
    });

    return article;
  } catch (error) {
    throw error;
  }
};

export const getArticle = async (id: number) => {
  try {
    const article = await prisma.article.findUnique({
      where: {
         id 
      },
    });
    return article;
  } catch (error) {
    throw error;
  }
};
export const getArticles = async () => {
  try {
    const articles = await prisma.article.findMany();
    return articles;
  } catch (error) {
    throw error;
  }
};

export const updateArticle = async (
  id: number,
  title: string,
  content: string
) => {
  try {
    const article = await prisma.article.update({
      where: { id },
      data: {
        title,
        content,
      },
    });
    return article;
  } catch (error) {
    throw error;
  }
};

export const deleteArticle = async (id: number) => {
  try {
    const article = await prisma.article.delete({
      where: { id },
    });
    return article;
  } catch (error) {
    throw error;
  }
};
