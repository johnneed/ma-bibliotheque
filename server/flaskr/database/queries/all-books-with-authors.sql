select 
	b.id,
	b.title,
	b.subtitle,
	b.language,
	b.bookSRC,
	b.yearPublished,
	b.coverSRC,
	b.description,
	b.ISBN,
	b.AMAZON,
	b.GOOGLE,
	a.firstName,
	a.middleName,
	a.lastName,
	a.portraitSRC,
	a.bio

 from BOOKS b 
 LEFT JOIN BOOKS_2_AUTHORS ON BOOKS_2_AUTHORS.bookID = b.id
 LEFT JOIN AUTHORS a ON BOOKS_2_AUTHORS.authorID = a.id