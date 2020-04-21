/* SEARCH BOOKS BY TITLE */
PRAGMA case_sensitive_like = false;
SELECT * from BOOKS b WHERE b.title LIKE '%poem%';
