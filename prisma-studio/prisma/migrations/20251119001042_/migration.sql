-- CreateTable
CREATE TABLE "Book" (
    "book_id" UUID NOT NULL,
    "total_book_count" BIGINT NOT NULL DEFAULT 0,
    "book_count" BIGINT NOT NULL DEFAULT 0,
    "book_name" CHAR(100) NOT NULL,
    "book_authors" CHAR(500) NOT NULL,
    "book_description" CHAR(500),

    CONSTRAINT "Book_pkey" PRIMARY KEY ("book_id")
);

-- CreateTable
CREATE TABLE "BookReserve" (
    "reserve_id" UUID NOT NULL,
    "book_id" UUID NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expires_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "times_renewed" INTEGER NOT NULL DEFAULT 0,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "BookReserve_pkey" PRIMARY KEY ("reserve_id")
);

-- AddForeignKey
ALTER TABLE "BookReserve" ADD CONSTRAINT "BookReserve_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "Book"("book_id") ON DELETE RESTRICT ON UPDATE CASCADE;
