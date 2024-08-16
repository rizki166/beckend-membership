/*
  Warnings:

  - You are about to drop the column `subscriptionId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `SubscriptionArticle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SubscriptionVideo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SubscriptionArticles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SubscriptionVideos` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "SubscriptionArticle" DROP CONSTRAINT "SubscriptionArticle_articleId_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionArticle" DROP CONSTRAINT "SubscriptionArticle_subscriptionId_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionVideo" DROP CONSTRAINT "SubscriptionVideo_subscriptionId_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionVideo" DROP CONSTRAINT "SubscriptionVideo_videoId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_subscriptionId_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionArticles" DROP CONSTRAINT "_SubscriptionArticles_A_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionArticles" DROP CONSTRAINT "_SubscriptionArticles_B_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionVideos" DROP CONSTRAINT "_SubscriptionVideos_A_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionVideos" DROP CONSTRAINT "_SubscriptionVideos_B_fkey";

-- AlterTable
ALTER TABLE "Subscription" ADD COLUMN     "articleId" INTEGER[],
ADD COLUMN     "videoId" INTEGER[];

-- AlterTable
ALTER TABLE "User" DROP COLUMN "subscriptionId",
ADD COLUMN     "subscriptionName" TEXT;

-- DropTable
DROP TABLE "SubscriptionArticle";

-- DropTable
DROP TABLE "SubscriptionVideo";

-- DropTable
DROP TABLE "_SubscriptionArticles";

-- DropTable
DROP TABLE "_SubscriptionVideos";

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_subscriptionName_fkey" FOREIGN KEY ("subscriptionName") REFERENCES "Subscription"("name") ON DELETE SET NULL ON UPDATE CASCADE;
