-- Migration number: 0001 	 2026-10-13T08:55:17.399Z
CREATE TABLE users (
  "github_id" INTEGER PRIMARY KEY, 
  "username" TEXT NOT NULL,
  "created_at" TIMESTAMP DEFAULT (datetime('now')) NOT NULL
);

CREATE TABLE progress (
  "lesson" TEXT NOT NULL,
  "user_github_id" INTEGER REFERENCES users(github_id)
      ON DELETE CASCADE NOT NULL,
  "status" TEXT CHECK(status IN ('in_progress','complete')) NOT NULL,
  "completed_at" TIMESTAMP,
  PRIMARY KEY ("lesson", "user_github_id"),
  CHECK (("status" = 'complete' AND "completed_at" IS NOT NULL)
      OR ("status" = 'in_progress' AND "completed_at" IS NULL))
);

