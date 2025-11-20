/*
  Warnings:

  - Added the required column `location` to the `BookReserve` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "BookReserve" ADD COLUMN     "location" TEXT NOT NULL;
