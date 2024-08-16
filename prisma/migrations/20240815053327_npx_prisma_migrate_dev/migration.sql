/*
  Warnings:

  - You are about to drop the column `subscriptionId` on the `Article` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Video` table. All the data in the column will be lost.
  - You are about to drop the column `subscriptionId` on the `Video` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Article" DROP CONSTRAINT "Article_subscriptionId_fkey";

-- DropForeignKey
ALTER TABLE "Video" DROP CONSTRAINT "Video_subscriptionId_fkey";

-- AlterTable
ALTER TABLE "Article" DROP COLUMN "subscriptionId";

-- AlterTable
ALTER TABLE "Subscription" ADD COLUMN     "articleId" INTEGER[],
ADD COLUMN     "videoId" INTEGER[];

-- AlterTable
ALTER TABLE "Video" DROP COLUMN "description",
DROP COLUMN "subscriptionId";
