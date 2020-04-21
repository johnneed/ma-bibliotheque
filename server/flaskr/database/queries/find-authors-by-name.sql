/* SEARCH AUTHOR BY NAME */
PRAGMA case_sensitive_like = false;
SELECT * from AUTHORS a WHERE a.firstName LIKE '%k%'   OR a.lastName LIKE '%k%'  OR a.middleName LIKE '%k%'
