-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2023 at 12:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookify`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(20) NOT NULL,
  `pass` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `pass`) VALUES
('admin', 'f865b53623b121fd34ee5426c792e5c33af8c227');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_isbn` varchar(20) NOT NULL,
  `book_title` varchar(60) DEFAULT NULL,
  `book_author` varchar(60) DEFAULT NULL,
  `book_image` varchar(40) DEFAULT NULL,
  `book_descr` text DEFAULT NULL,
  `book_price` decimal(6,2) NOT NULL,
  `publisherid` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_isbn`, `book_title`, `book_author`, `book_image`, `book_descr`, `book_price`, `publisherid`, `created_at`) VALUES
('978-0128119051', 'Computer Architecture', 'John L. Hennessy', 'computer_architecture.jpg', 'Computer Architecture: A Quantitative Approach, Sixth Edition has been considered essential reading by instructors, students and practitioners of computer design for over 20 years. The sixth edition of this classic textbook from Hennessy and Patterson, winners of the 2017 ACM A.M. Turing Award recognizing contributions of lasting and major technical importance to the computing field, is fully revised with the latest developments in processor and system architecture. The text now features examples from the RISC V (RISC Five) instruction set architecture, a modern RISC instruction set developed and designed to be a free and openly adoptable standard. It also includes a new chapter on domain specific architectures and an updated chapter on warehouse scale computing that features the first public information on Google\'s newest WSC', '85.71', 4, '2023-06-16 11:32:33'),
('978-0128182000', 'Computer Networks', 'Larry L. Peterson', 'computer_networks.jpg', 'Computer Networks: A Systems Approach, Sixth Edition, explores the key principles of computer networking, using real world examples from network and protocol design. Using the Internet as the primary example, this best-selling classic textbook explains various protocols and networking technologies. The systems-oriented approach encourages students to think about how individual network components fit into a larger, complex system of interactions. This sixth edition contains completely updated content with expanded coverage of the topics of utmost importance to networking professionals and students, as provided by numerous contributors via a unique open source model developed jointly by the authors and publisher.', '81.68', 4, '2023-06-16 01:24:00'),
('978-0131103627', 'C Programming Language', 'Brian W. Kernighan', 'c_programming.jpg', 'The authors present the complete guide to ANSI standard C language programming. Written by the developers of C, this new version helps readers keep up with the finalized ANSI standard for C while showing how to take advantage of C\'s rich set of operators, economy of expression, improved control flow, and data structures. The 2/E has been completely rewritten with additional examples and problem sets to clarify the implementation of difficult language constructs. For years, C programmers have let K&R guide them to building well-structured and efficient programs. Now this same help is available to those working with ANSI compilers. Includes detailed coverage of the C language plus the official C language reference manual for at-a-glance help with syntax notation, declarations, ANSI changes, scope rules, and the list goes on and on.', '99.18', 1, '2023-06-16 00:38:25'),
('978-0131873254', 'Database Systems', 'Hector Garcia-Molina', 'database_systems.jpg', 'Database Systems: The Complete Book is ideal for Database Systems and Database Design and Application courses offered at the junior, senior and graduate levels in Computer Science departments. A basic understanding of algebraic expressions and laws, logic, basic data structure, OOP concepts, and programming environments is implied.', '191.99', 1, '2023-06-16 00:51:00'),
('978-0134549897', 'Digital Design', 'M. Morris Mano', 'digital_design.jpg', 'A modern update to a classic, authoritative text, Digital Design, 5th Edition teaches the fundamental concepts of digital design in a clear, accessible manner. The text presents the basic tools for the design of digital circuits and provides procedures suitable for a variety of digital applications. Like the previous editions, this edition of Digital Design supports a multimodal approach to learning, with a focus on digital design, regardless of language. Recognizing that three public-domain languages?Verilog, VHDL, and SystemVerilog?all play a role in design flows for today’s digital devices, the 5th Edition offers parallel tracks of presentation of multiple languages, but allows concentration on a single, chosen language.', '218.66', 1, '2023-06-16 11:40:59'),
('978-0262046305', 'Introduction to Algorithms', 'Thomas H. Cormen', 'intro_to_algorithms.jpg', 'Some books on algorithms are rigorous but incomplete; others cover masses of material but lack rigor. Introduction to Algorithms uniquely combines rigor and comprehensiveness. It covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers, with self-contained chapters and algorithms in pseudocode. Since the publication of the first edition, Introduction to Algorithms has become the leading algorithms text in universities worldwide as well as the standard reference for professionals. This fourth edition has been updated throughout.', '120.21', 3, '2023-06-16 00:58:08'),
('978-0375726262', 'American Prometheus', 'Kai Bird', 'oppenheimer.jpg', '#1 NEW YORK TIMES BESTSELLER • PULITZER PRIZE WINNER • The definitive biography of J. Robert Oppenheimer, one of the iconic figures of the twentieth century, a brilliant physicist who led the effort to build the atomic bomb for his country in a time of war, and who later found himself confronting the moral consequences of scientific progress.', '15.99', 8, '2023-08-06 14:38:59'),
('978-1118008188', 'HTML and CSS: Design and Build Websites', 'Jon Duckett', 'htmlandcss.jpg', 'Every day, more and more people want to learn some HTML and CSS. Joining the professional web designers and programmers are new audiences who need to know a little bit of code at work (update a content management system or e-commerce store) and those who want to make their personal blogs more attractive. Many books teaching HTML and CSS are dry and only written for those who want to become programmers, which is why this book takes an entirely new approach.', '17.99', 9, '2023-08-06 16:05:13'),
('978-1119149224', 'PHP & MySQL: Server-side Web Development', 'Jon Duckett', 'phpandsql.jpg', 'Learn PHP, the programming language used to build sites like Facebook, Wikipedia and WordPress, then discover how these sites store information in a database (MySQL) and use the database to create the web pages.', '26.99', 9, '2023-08-06 15:49:02'),
('978-1260226409', 'Fundamentals of Electric Circuits', 'Charles Alexander', 'electric_circuits.jpg', 'Fundamentals of Electric Circuits continues in the spirit of its successful previous editions, with the objective of presenting circuit analysis in a manner that is clearer, more interesting, and easier to understand than other, more traditional texts. A balance of theory, worked & extended examples, practice problems, and real-world applications, combined with over 580 new or changed homework problems complete this edition.', '179.45', 5, '2023-06-16 11:51:07'),
('978-1491910771', 'Head First Java', 'Kathy Sierra', 'headfirstjava.jpg', 'Head First Java is a complete learning experience in Java and object-oriented programming. With this book, you\'ll learn the Java language with a unique method that goes beyond how-to manuals and helps you become a great programmer. Through puzzles, mysteries, and soul-searching interviews with famous Java objects, you\'ll quickly get up to speed on Java\'s fundamentals and advanced topics including lambdas, streams, generics, threading, networking, and the dreaded desktop GUI. If you have experience with another programming language, Head First Java will engage your brain with more modern approaches to coding--the sleeker, faster, and easier to read, write, and maintain Java of today.', '45.49', 2, '2023-06-16 00:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerid` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerid`, `name`, `address`, `city`, `zip_code`, `country`) VALUES
(10, 'Mansitha Eashwara', '101.Dharmaraja Roda,Kandy', 'Kandy', '1000', 'Sri Lanka'),
(11, 'Eranga', 'Agunawela,Kandy', 'Kandy', '2000', 'Sri Lanka'),
(12, 'Sayumi Muthkumarana', 'Fort, Matara', 'Matara', '8000', 'Sri Lanka'),
(13, 'Sandamini Madhurasinghe', '176/5,Kurunegala Rd,Kurunegala+', 'Kurunegala', '5000', 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `customerid` int(10) UNSIGNED NOT NULL,
  `amount` decimal(6,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_name` char(60) NOT NULL,
  `ship_address` char(80) NOT NULL,
  `ship_city` char(30) NOT NULL,
  `ship_zip_code` char(10) NOT NULL,
  `ship_country` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `customerid`, `amount`, `date`, `customer_name`, `ship_address`, `ship_city`, `ship_zip_code`, `ship_country`) VALUES
(10, 9, '1200.00', '2023-06-15 15:26:44', 'Mansitha', 'DharamarajaRd,Kandy', 'Kandy', '8369', 'Sri Lanka'),
(11, 10, '240.42', '2023-06-15 16:10:53', 'Mansitha Eashwara', '101.Dharmaraja Roda,Kandy', 'Kandy', '1000', 'Sri Lanka'),
(12, 11, '171.42', '2023-06-16 02:57:06', 'Eranga', 'Agunawela,Kandy', 'Kandy', '2000', 'Sri Lanka'),
(13, 12, '85.71', '2023-08-05 12:08:25', 'Sayumi Muthkumarana', 'Fort, Matara', 'Matara', '8000', 'Sri Lanka'),
(14, 13, '31.98', '2023-08-06 06:51:47', 'Sandamini Madhurasinghe', '176/5,Kurunegala Rd,Kurunegala+', 'Kurunegala', '5000', 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `book_isbn` varchar(20) NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`orderid`, `book_isbn`, `item_price`, `quantity`) VALUES
(11, '978-0262046305', '120.21', 2),
(12, '978-0128119051', '85.71', 2),
(13, '978-0128119051', '85.71', 1),
(14, '978-0375726262', '15.99', 2);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisherid` int(10) UNSIGNED NOT NULL,
  `publisher_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherid`, `publisher_name`) VALUES
(1, 'Pearson'),
(2, 'O\'Reilly Media'),
(3, 'The MIT Press'),
(4, 'Morgan Kaufmann'),
(5, 'McGraw Hill'),
(8, 'Vintage Books'),
(9, 'Wiley');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`name`,`pass`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_isbn`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
