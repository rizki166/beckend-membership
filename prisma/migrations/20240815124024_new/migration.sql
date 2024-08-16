/*
  Warnings:

  - You are about to drop the column `isAdmin` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `subscriptionName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `Video` table. All the data in the column will be lost.
  - You are about to drop the `Subscription` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SubscriptionArticle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SubscriptionVideo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SubscriptionArticles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SubscriptionVideos` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `membershipType` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.
  - Made the column `description` on table `Video` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "MembershipType" AS ENUM ('A', 'B', 'C');

-- DropForeignKey
ALTER TABLE "SubscriptionArticle" DROP CONSTRAINT "SubscriptionArticle_articleId_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionArticle" DROP CONSTRAINT "SubscriptionArticle_subscriptionId_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionVideo" DROP CONSTRAINT "SubscriptionVideo_subscriptionId_fkey";

-- DropForeignKey
ALTER TABLE "SubscriptionVideo" DROP CONSTRAINT "SubscriptionVideo_videoId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_subscriptionName_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionArticles" DROP CONSTRAINT "_SubscriptionArticles_A_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionArticles" DROP CONSTRAINT "_SubscriptionArticles_B_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionVideos" DROP CONSTRAINT "_SubscriptionVideos_A_fkey";

-- DropForeignKey
ALTER TABLE "_SubscriptionVideos" DROP CONSTRAINT "_SubscriptionVideos_B_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "isAdmin",
DROP COLUMN "subscriptionName",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "membershipType" "MembershipType" NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Video" DROP COLUMN "image",
ALTER COLUMN "description" SET NOT NULL;

-- DropTable
DROP TABLE "Subscription";

-- DropTable
DROP TABLE "SubscriptionArticle";

-- DropTable
DROP TABLE "SubscriptionVideo";

-- DropTable
DROP TABLE "_SubscriptionArticles";

-- DropTable
DROP TABLE "_SubscriptionVideos";
