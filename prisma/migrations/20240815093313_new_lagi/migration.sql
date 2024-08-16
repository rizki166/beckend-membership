/*
  Warnings:

  - You are about to drop the column `subscriptionId` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Subscription` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_subscriptionId_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "subscriptionId",
ADD COLUMN     "subscriptionName" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Subscription_name_key" ON "Subscription"("name");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_subscriptionName_fkey" FOREIGN KEY ("subscriptionName") REFERENCES "Subscription"("name") ON DELETE SET NULL ON UPDATE CASCADE;
