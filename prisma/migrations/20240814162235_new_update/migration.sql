/*
  Warnings:

  - You are about to drop the `_UserArticles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_UserVideos` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `userId` to the `Article` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Video` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Video` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_UserArticles" DROP CONSTRAINT "_UserArticles_A_fkey";

-- DropForeignKey
ALTER TABLE "_UserArticles" DROP CONSTRAINT "_UserArticles_B_fkey";

-- DropForeignKey
ALTER TABLE "_UserVideos" DROP CONSTRAINT "_UserVideos_A_fkey";

-- DropForeignKey
ALTER TABLE "_UserVideos" DROP CONSTRAINT "_UserVideos_B_fkey";

-- AlterTable
ALTER TABLE "Article" ADD COLUMN     "userId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "isAdmin" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Video" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "userId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_UserArticles";

-- DropTable
DROP TABLE "_UserVideos";

-- AddForeignKey
ALTER TABLE "Video" ADD CONSTRAINT "Video_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
