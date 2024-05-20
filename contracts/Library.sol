
pragma solidity ^0.8.0;

contract Library {
    struct Book {
        uint256 id;
        string title;
        string author;
        address owner;
        bool isAvailable;
    }

    mapping(uint256 => Book) public books;
    uint256 public totalBooks;

    event BookAdded(uint256 id, string title, string author);
    event BookBorrowed(uint256 id, address borrower);
    event BookReturned(uint256 id);

    function addBook(string memory _title, string memory _author) public {
        totalBooks++;
        books[totalBooks] = Book(totalBooks, _title, _author, msg.sender, true);
        emit BookAdded(totalBooks, _title, _author);
    }

    function borrowBook(uint256 _id) public {
        require(books[_id].isAvailable == true, "Book is not available");
        books[_id].isAvailable = false;
        emit BookBorrowed(_id, msg.sender);
    }

    function returnBook(uint256 _id) public {
        require(books[_id].isAvailable == false, "Book is already available");
        require(books[_id].owner == msg.sender, "Only the owner can return the book");
        books[_id].isAvailable = true;
        emit BookReturned(_id);
    }
}
