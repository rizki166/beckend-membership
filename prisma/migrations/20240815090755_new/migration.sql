/*
  Warnings:

  - You are about to drop the column `articleId` on the `Subscription` table. All the data in the column will be lost.
  - You are about to drop the column `videoId` on the `Subscription` table. All the data in the column will be lost.
  - You are about to drop the column `subscriptionName` on the `User` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_subscriptionName_fkey";

-- DropIndex
DROP INDEX "Subscription_name_key";

-- AlterTable
ALTER TABLE "Subscription" DROP COLUMN "articleId",
DROP COLUMN "videoId";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "subscriptionName",
ADD COLUMN     "subscriptionId" INTEGER;

-- AlterTable
ALTER TABLE "Video" ADD COLUMN     "description" TEXT;

-- CreateTable
CREATE TABLE "SubscriptionVideo" (
    "subscriptionId" INTEGER NOT NULL,
    "videoId" INTEGER NOT NULL,

    CONSTRAINT "SubscriptionVideo_pkey" PRIMARY KEY ("subscriptionId","videoId")
);

-- CreateTable
CREATE TABLE "SubscriptionArticle" (
    "subscriptionId" INTEGER NOT NULL,
    "articleId" INTEGER NOT NULL,

    CONSTRAINT "SubscriptionArticle_pkey" PRIMARY KEY ("subscriptionId","articleId")
);

-- CreateTable
CREATE TABLE "_SubscriptionVideos" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_SubscriptionArticles" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_SubscriptionVideos_AB_unique" ON "_SubscriptionVideos"("A", "B");

-- CreateIndex
CREATE INDEX "_SubscriptionVideos_B_index" ON "_SubscriptionVideos"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_SubscriptionArticles_AB_unique" ON "_SubscriptionArticles"("A", "B");

-- CreateIndex
CREATE INDEX "_SubscriptionArticles_B_index" ON "_SubscriptionArticles"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionVideo" ADD CONSTRAINT "SubscriptionVideo_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionVideo" ADD CONSTRAINT "SubscriptionVideo_videoId_fkey" FOREIGN KEY ("videoId") REFERENCES "Video"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionArticle" ADD CONSTRAINT "SubscriptionArticle_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionArticle" ADD CONSTRAINT "SubscriptionArticle_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubscriptionVideos" ADD CONSTRAINT "_SubscriptionVideos_A_fkey" FOREIGN KEY ("A") REFERENCES "Subscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubscriptionVideos" ADD CONSTRAINT "_SubscriptionVideos_B_fkey" FOREIGN KEY ("B") REFERENCES "Video"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubscriptionArticles" ADD CONSTRAINT "_SubscriptionArticles_A_fkey" FOREIGN KEY ("A") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubscriptionArticles" ADD CONSTRAINT "_SubscriptionArticles_B_fkey" FOREIGN KEY ("B") REFERENCES "Subscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;
