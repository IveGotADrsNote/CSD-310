DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;


CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(75)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(100)    NOT NULL,
    author      VARCHAR(100)    NOT NULL,
    details     VARCHAR(350),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('221b Baker St. London, UK');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('A Scanner Darkly', 'Philip K. Dick', 'An undercover narcotics detective begins mixing up his real identity and his undercover one');

INSERT INTO book(book_name, author, details)
    VALUES('A Study In Scarlet', 'Arthur Conan Doyle', 'Dr John H. Watson meets the great detective Sherlock Holmes and together they solve a case of murder');

INSERT INTO book(book_name, author, details)
    VALUES('Fight Club', 'Chuck Palahniuk', "follows the experiences of an unnamed protagonist struggling with insomnia. ");

INSERT INTO book(book_name, author, details)
    VALUES('The Casebook of Sherlock Holmes', 'Arthur Conan Doyle', 'A Collection Of Sherlock Holmes Short Stories');

INSERT INTO book(book_name, author, details)
    VALUES('A Game Of Thrones: A Song of Ice and Fire (Book 1)', 'George R.R. Martin', 'The First Book in the Song of Fire & Ice');

INSERT INTO book(book_name, author, details)
    VALUES("A Game Of Thrones: A Clash Of Kings (Book 2)", 'George R.R. Martin', 'Second Book');

INSERT INTO book(book_name, author, details)
    VALUES('A Game Of Thrones: A Storm of Swords (Book 3)', 'George R.R. Martin', 'Third Book');

INSERT INTO book(book_name, author, details)
    VALUES('A Game Of Thrones: A Feast For Crows (Book 4)', 'George R.R. Martin', 'Fourth Book');

INSERT INTO book(book_name, author, details)
    VALUES('A Game Of Thrones: A Dance With Dragons (Book 5)', 'George R.R. Martin', 'Fifth Book');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Tyler', 'Durden');

INSERT INTO user(first_name, last_name)
    VALUES('Robb', 'Stark');

INSERT INTO user(first_name, last_name)
    VALUES('John', 'Watson');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Tyler'), 
        (SELECT book_id FROM book WHERE book_name = 'Fight Club')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Robb'),
        (SELECT book_id FROM book WHERE book_name = 'A Game Of Thrones: A Clash Of Kings (Book 2)')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'John'),
        (SELECT book_id FROM book WHERE book_name = 'A Study In Scarlet')
    );