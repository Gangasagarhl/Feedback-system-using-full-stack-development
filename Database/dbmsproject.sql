-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 12:23 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmsproject`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `stp_procedure` (IN `c` VARCHAR(50))  SELECT e.fname,e.lname,t.semsec,t.subject from teaching t ,employee e
WHERE e.empid=c and e.empid=t.empid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user`, `password`) VALUES
('CSE', 'ROOT');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `empid` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`fname`, `lname`, `empid`, `password`, `admin`) VALUES
('CHAITRA', '', '1SGE01', '1', 'CSE'),
('LATHA', 'A', '1SGE02', '2', 'CSE'),
('MADHUSHREE', '', '1SGE03', '3', 'CSE'),
('SURIYA', 'PRAKASH', '1SGE04', '4', 'CSE'),
('VEENA', 'KR', '1SGE05', '5', 'CSE'),
('ANURADHA', 'BADAGE', '1SGE06', '6', 'CSE'),
('NANDA', 'MB', '1SGE07', '7', 'CSE'),
('KAVITHA', 'GOWDA', '1SGE08', '8', 'CSE'),
('KAMALAKSHI', 'NAGANNA', '1SGE09', '9', 'CSE'),
('SRIKANTH', 'GOWDA', '1SGE12', '12', 'CSE'),
('KAVYA', 'NL', '1SGE13', '13', 'CSE'),
('MANASA', '', '1SGE14', '14', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `q1` varchar(30) DEFAULT NULL,
  `q2` varchar(30) DEFAULT NULL,
  `q3` varchar(30) DEFAULT NULL,
  `q4` varchar(30) DEFAULT NULL,
  `q5` varchar(30) DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`q1`, `q2`, `q3`, `q4`, `q5`, `admin`) VALUES
('Teaching', 'Explaining', 'Usage of board', 'Audible', 'Clear Doubts', NULL),
('Teaching', 'Explaining', 'Usage of board', 'Audible', 'Clear Doubts', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `empid` varchar(20) DEFAULT NULL,
  `usn` varchar(20) DEFAULT NULL,
  `q1` int(2) DEFAULT NULL,
  `q2` int(2) DEFAULT NULL,
  `q3` int(2) DEFAULT NULL,
  `q4` int(2) DEFAULT NULL,
  `q5` int(2) DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `semsec` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`empid`, `usn`, `q1`, `q2`, `q3`, `q4`, `q5`, `admin`, `semsec`) VALUES
('1SGE01', '1SG17CS003', 10, 9, 8, 5, 10, 'CSE', '5A'),
('1SGE01', '1SG17CS004', 5, 10, 9, 10, 10, 'CSE', '5A'),
('1SGE01', '1SG17CS005', 8, 4, 5, 6, 10, 'CSE', '5A'),
('1SGE01', '1SG17CS006', 10, 10, 6, 10, 10, 'CSE', '5A'),
('1SGE01', '1SG17CS055', 10, 10, 5, 1, 2, 'CSE', '5B'),
('1SGE01', '1SG17CS056', 1, 0, 9, 10, 10, 'CSE', '5B'),
('1SGE01', '1SG17CS057', 1, 2, 3, 6, 5, 'CSE', '5B'),
('1SGE01', '1SG17CS058', 6, 3, 8, 4, 5, 'CSE', '5B'),
('1SGE01', '1SG17CS059', 10, 2, 3, 5, 4, 'CSE', '5B'),
('1SGE02', '1SG17CS001', 2, 3, 5, 7, 8, 'CSE', '5A'),
('1SGE02', '1SG17CS003', 5, 8, 5, 4, 9, 'CSE', '5A'),
('1SGE02', '1SG17CS004', 2, 3, 5, 8, 7, 'CSE', '5A'),
('1SGE02', '1SG17CS005', 7, 4, 5, 4, 9, 'CSE', '5A'),
('1SGE02', '1SG17CS006', 6, 9, 6, 8, 6, 'CSE', '5A'),
('1SGE02', '1SG17CS055', 7, 4, 1, 10, 10, 'CSE', '5B'),
('1SGE02', '1SG17CS056', 10, 9, 10, 10, 10, 'CSE', '5B'),
('1SGE02', '1SG17CS057', 8, 5, 10, 1, 7, 'CSE', '5B'),
('1SGE02', '1SG17CS058', 5, 3, 6, 8, 8, 'CSE', '5B'),
('1SGE02', '1SG17CS059', 8, 2, 8, 5, 6, 'CSE', '5B'),
('1SGE05', '1SG17CS001', 10, 10, 10, 10, 9, 'CSE', '5A'),
('1SGE05', '1SG17CS003', 10, 10, 8, 10, 10, 'CSE', '5A'),
('1SGE05', '1SG17CS004', 10, 9, 10, 9, 8, 'CSE', '5A'),
('1SGE05', '1SG17CS005', 10, 8, 10, 10, 10, 'CSE', '5A'),
('1SGE05', '1SG17CS006', 10, 8, 9, 9, 9, 'CSE', '5A'),
('1SGE05', '1SG17CS055', 10, 9, 8, 8, 10, 'CSE', '5B'),
('1SGE05', '1SG17CS056', 10, 9, 0, 7, 7, 'CSE', '5B'),
('1SGE05', '1SG17CS057', 10, 7, 1, 6, 10, 'CSE', '5B'),
('1SGE05', '1SG17CS058', 0, 10, 6, 10, 10, 'CSE', '5B'),
('1SGE05', '1SG17CS059', 10, 10, 10, 10, 10, 'CSE', '5B'),
('1SGE06', '1SG17CS001', 8, 8, 8, 5, 10, 'CSE', '5A'),
('1SGE06', '1SG17CS003', 7, 8, 2, 10, 10, 'CSE', '5A'),
('1SGE06', '1SG17CS004', 6, 7, 5, 8, 10, 'CSE', '5A'),
('1SGE06', '1SG17CS005', 7, 10, 10, 10, 10, 'CSE', '5A'),
('1SGE06', '1SG17CS006', 5, 7, 8, 10, 10, 'CSE', '5A'),
('1SGE06', '1SG17CS055', 8, 4, 7, 10, 6, 'CSE', '5B'),
('1SGE06', '1SG17CS056', 9, 6, 8, 10, 4, 'CSE', '5B'),
('1SGE06', '1SG17CS057', 9, 5, 10, 10, 10, 'CSE', '5B'),
('1SGE06', '1SG17CS058', 10, 3, 4, 10, 10, 'CSE', '5B'),
('1SGE06', '1SG17CS059', 6, 5, 2, 7, 10, 'CSE', '5B'),
('1SGE07', '1SG17CS001', 10, 10, 10, 10, 7, 'CSE', '5A'),
('1SGE07', '1SG17CS003', 10, 8, 6, 2, 2, 'CSE', '5A'),
('1SGE07', '1SG17CS004', 10, 8, 9, 1, 9, 'CSE', '5A'),
('1SGE07', '1SG17CS005', 10, 9, 6, 6, 5, 'CSE', '5A'),
('1SGE07', '1SG17CS006', 9, 3, 7, 10, 7, 'CSE', '5A'),
('1SGE07', '1SG17CS055', 3, 10, 8, 6, 9, 'CSE', '5B'),
('1SGE07', '1SG17CS056', 4, 6, 9, 8, 4, 'CSE', '5B'),
('1SGE07', '1SG17CS057', 6, 3, 10, 10, 10, 'CSE', '5B'),
('1SGE07', '1SG17CS058', 5, 9, 0, 5, 7, 'CSE', '5B'),
('1SGE07', '1SG17CS059', 4, 10, 5, 2, 8, 'CSE', '5B'),
('1SGE12', '1SG17CS001', 10, 10, 10, 9, 9, 'CSE', '5A'),
('1SGE12', '1SG17CS003', 10, 10, 9, 10, 9, 'CSE', '5A'),
('1SGE12', '1SG17CS004', 9, 10, 8, 7, 10, 'CSE', '5A'),
('1SGE12', '1SG17CS005', 10, 10, 10, 10, 10, 'CSE', '5A'),
('1SGE12', '1SG17CS006', 10, 10, 10, 10, 10, 'CSE', '5A'),
('1SGE12', '1SG17CS055', 10, 10, 10, 10, 10, 'CSE', '5B'),
('1SGE12', '1SG17CS056', 9, 9, 6, 2, 9, 'CSE', '5B'),
('1SGE12', '1SG17CS057', 10, 7, 7, 8, 8, 'CSE', '5B'),
('1SGE12', '1SG17CS058', 10, 8, 10, 8, 10, 'CSE', '5B'),
('1SGE12', '1SG17CS059', 10, 10, 10, 10, 9, 'CSE', '5B'),
('1SGE13', '1SG17CS001', 6, 10, 9, 8, 8, 'CSE', '5A'),
('1SGE13', '1SG17CS003', 5, 0, 9, 10, 10, 'CSE', '5A'),
('1SGE13', '1SG17CS004', 10, 6, 0, 3, 0, 'CSE', '5A'),
('1SGE13', '1SG17CS005', 10, 10, 10, 10, 1, 'CSE', '5A'),
('1SGE13', '1SG17CS006', 10, 4, 9, 8, 3, 'CSE', '5A'),
('1SGE13', '1SG17CS055', 10, 5, 10, 9, 10, 'CSE', '5B'),
('1SGE13', '1SG17CS056', 8, 10, 7, 0, 5, 'CSE', '5B'),
('1SGE13', '1SG17CS057', 6, 7, 10, 10, 6, 'CSE', '5B'),
('1SGE13', '1SG17CS058', 10, 6, 5, 9, 10, 'CSE', '5B'),
('1SGE13', '1SG17CS059', 10, 5, 7, 9, 10, 'CSE', '5B'),
('1SGE03', '1SG16CS001', 10, 10, 10, 10, 10, 'CSE', '7A'),
('1SGE03', '1SG16CS002', 10, 10, 10, 10, 10, 'CSE', '7A'),
('1SGE03', '1SG16CS003', 10, 10, 10, 10, 10, 'CSE', '7A'),
('1SGE03', '1SG16CS004', 18, 10, 10, 10, 10, 'CSE', '7A'),
('1SGE03', '1SG16CS005', 10, 0, 0, 1, 1, 'CSE', '7A'),
('1SGE04', '1SG16CS413', 9, 10, 10, 10, 10, 'CSE', '7B'),
('1SGE04', '1SG16CS418', 7, 8, 10, 10, 4, 'CSE', '7B'),
('1SGE04', '1SG16CS063', 6, 10, 10, 10, 10, 'CSE', '7B'),
('1SGE04', '1SG16CS067', 10, 10, 10, 10, 10, 'CSE', '7B'),
('1SGE04', '1SG16CS068', 2, 19, 9, 8, 6, 'CSE', '7B'),
('1SGE08', '1SG18CS001', 3, 6, 8, 7, 5, 'CSE', '3A'),
('1SGE08', '1SG18CS002', 6, 8, 10, 6, 8, 'CSE', '3A'),
('1SGE08', '1SG18CS003', 9, 3, 1, 5, 9, 'CSE', '3A'),
('1SGE08', '1SG18CS004', 3, 6, 0, 4, 10, 'CSE', '3A'),
('1SGE08', '1SG18CS005', 9, 3, 0, 3, 10, 'CSE', '3A'),
('1SGE08', '1SG18CS065', 10, 10, 10, 10, 5, 'CSE', '3B'),
('1SGE08', '1SG18CS066', 10, 9, 8, 8, 10, 'CSE', '3B'),
('1SGE08', '1SG18CS068', 10, 10, 10, 10, 10, 'CSE', '3B'),
('1SGE08', '1SG18CS069', 10, 8, 7, 8, 10, 'CSE', '3B'),
('1SGE08', '1SG18CS070', 9, 8, 7, 0, 6, 'CSE', '3B'),
('1SGE09', '1SG18CS001', 10, 10, 10, 10, 10, 'CSE', '3A'),
('1SGE09', '1SG18CS002', 8, 9, 8, 10, 9, 'CSE', '3A'),
('1SGE09', '1SG18CS003', 9, 9, 9, 10, 9, 'CSE', '3A'),
('1SGE09', '1SG18CS004', 9, 10, 9, 9, 9, 'CSE', '3A'),
('1SGE09', '1SG18CS005', 9, 9, 10, 9, 9, 'CSE', '3A'),
('1SGE09', '1SG18CS065', 9, 9, 9, 8, 0, 'CSE', '3B'),
('1SGE09', '1SG18CS066', 9, 10, 10, 10, 10, 'CSE', '3B'),
('1SGE09', '1SG18CS068', 10, 10, 10, 10, 10, 'CSE', '3B'),
('1SGE09', '1SG18CS069', 10, 10, 10, 10, 7, 'CSE', '3B'),
('1SGE09', '1SG18CS070', 0, 10, 10, 10, 10, 'CSE', '3B'),
('1SGE14', '1SG17CS001', 10, 10, 10, 10, 10, 'CSE', '5A'),
('1SGE14', '1SG17CS003', 10, 9, 8, 9, 10, 'CSE', '5A'),
('1SGE14', '1SG17CS004', 7, 6, 7, 9, 10, 'CSE', '5A'),
('1SGE14', '1SG17CS005', 5, 5, 10, 9, 10, 'CSE', '5A'),
('1SGE14', '1SG17CS006', 4, 10, 9, 9, 10, 'CSE', '5A'),
('1SGE14', '1SG17CS055', 10, 9, 9, 9, 10, 'CSE', '5B'),
('1SGE14', '1SG17CS056', 10, 6, 9, 7, 10, 'CSE', '5B'),
('1SGE14', '1SG17CS057', 6, 4, 10, 8, 10, 'CSE', '5B'),
('1SGE14', '1SG17CS058', 7, 9, 8, 10, 6, 'CSE', '5B'),
('1SGE14', '1SG17CS059', 10, 10, 9, 10, 5, 'CSE', '5B'),
('1SGE01', '1SG17CS001', 10, 9, 10, 10, 8, 'CSE', '5A'),
('1SGE01', '1SG17CS001', 10, 9, 10, 10, 8, 'CSE', '5A'),
('1SGE03', '1sg16cs030', 3, 10, 10, 10, 10, 'CSE', '7A');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `usn` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `semsec` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`fname`, `lname`, `usn`, `password`, `admin`, `semsec`) VALUES
('ADITY ', 'DEY', '1SG15CS005', '5', 'CSE', '7A'),
('BHUVAN ', 'REDDY', '1SG15CS018', '18', 'CSE', '7A'),
('KAVYA ', 'N G', '1SG15CS040', '40', 'CSE', '7A'),
('MEGHANA ', 'A NAYAKA', '1SG15CS053', '53', 'CSE', '7A'),
('SAURAJEET           ', 'BANARJEE  ', '1SG15CS096', '96', 'CSE', '7B'),
('SHWETHA ', 'S K', '1SG15CS102', '102', 'CSE', '7B'),
('SUMANTH ', 'N R', '1SG15CS109', '109', 'CSE', '7B'),
('YASHASWINI ', 'N', '1SG15CS126', '126', 'CSE', '7B'),
('ABHINETRA ', 'KUMAR', '1SG16CS001', '1', 'CSE', '7A'),
('ABHINAV ', 'ANAND', '1SG16CS002', '2', 'CSE', '7A'),
('ADARSH ', 'R M', '1SG16CS003', '3', 'CSE', '7A'),
('ADITYA ', 'DEEP', '1SG16CS004', '4', 'CSE', '7A'),
('AISHWARYA ', 'S', '1SG16CS005', '5', 'CSE', '7A'),
('AKASH ', 'KUMAR JAISWAL', '1SG16CS006', '6', 'CSE', '7A'),
('AMIR ', 'ALI RANGWALA', '1SG16CS007', '7', 'CSE', '7A'),
('AMUL ', 'L KATHRE', '1SG16CS008', '8', 'CSE', '7A'),
('ANAGHA ', 'R', '1SG16CS009', '9', 'CSE', '7A'),
('ANANYA ', 'R', '1SG16CS010', '10', 'CSE', '7A'),
('ANJANA ', 'R', '1SG16CS011', '11', 'CSE', '7A'),
('ANKIT ', 'KUMAR', '1SG16CS012', '12', 'CSE', '7A'),
('ARPITHA ', 'B Y', '1SG16CS013', '13', 'CSE', '7A'),
('ASHISH ', 'GOUROJI', '1SG16CS015', '15', 'CSE', '7A'),
('ASHWIN ', 'RAMESH P', '1SG16CS016', '16', 'CSE', '7A'),
('ASHWINI ', 'S', '1SG16CS017', '17', 'CSE', '7A'),
('BALAJI ', ' JANARDHAN', '1SG16CS018', '18', 'CSE', '7A'),
('BHARATH ', 'G N', '1SG16CS019', '19', 'CSE', '7A'),
('BINDHU ', 'M V', '1SG16CS020', '20', 'CSE', '7A'),
('BINDUSHREE ', 'G L', '1SG16CS021', '21', 'CSE', '7A'),
('CHAITANYA ', 'ANAND', '1SG16CS022', '22', 'CSE', '7A'),
('CHAITRA ', 'V', '1SG16CS023', '23', 'CSE', '7A'),
('CHATHURYA ', 'KANDIRAJU ', '1SG16CS024', '24', 'CSE', '7A'),
('CHITRA ', 'G', '1SG16CS025', '25', 'CSE', '7A'),
('DARSHAN ', 'P', '1SG16CS026', '26', 'CSE', '7A'),
('DEEPTI ', 'DNYANESHWAR GUNJAL', '1SG16CS027', '27', 'CSE', '7A'),
('DEVANSHU', 'SINGH', '1SG16CS028', '28', 'CSE', '7A'),
('DIVIJ ', 'N', '1SG16CS029', '29', 'CSE', '7A'),
('DIVYA', '', '1SG16CS030', '30', 'CSE', '7A'),
('GOGI ', 'REDDY SIVASANKAR RED', '1SG16CS032', '32', 'CSE', '7A'),
('HARISH ', 'BABU A', '1SG16CS034', '34', 'CSE', '7A'),
('HARISHA ', 'N', '1SG16CS035', '35', 'CSE', '7A'),
('HARSHITA  ', 'P', '1SG16CS036', '36', 'CSE', '7A'),
('JAI VENKATA ', 'SAI SRIRAM BATCHU', '1SG16CS039', '39', 'CSE', '7A'),
('JAYANTH ', 'G', '1SG16CS040', '40', 'CSE', '7A'),
('JAYANTH ', 'K N', '1SG16CS041', '41', 'CSE', '7A'),
('JEEVAN ', 'B K', '1SG16CS042', '42', 'CSE', '7A'),
('KARTHIK ', 'L', '1SG16CS043', '43', 'CSE', '7A'),
('KAUTILYA ', 'K BHAT', '1SG16CS044', '44', 'CSE', '7A'),
('KEERTHANA ', 'G', '1SG16CS045', '45', 'CSE', '7A'),
('KESHAV ', 'PRASAD C', '1SG16CS046', '46', 'CSE', '7A'),
('KIRAN ', 'M', '1SG16CS047', '47', 'CSE', '7A'),
('KUMAR ', 'ABHIJEET', '1SG16CS048', '48', 'CSE', '7A'),
('KUMARESH ', 'PRAKASH MADIWALAR', '1SG16CS049', '49', 'CSE', '7A'),
('LAXMI ', 'TRIPATHI', '1SG16CS050', '50', 'CSE', '7A'),
('LIKHITHA ', 'R', '1SG16CS051', '51', 'CSE', '7A'),
('LOKESH ', 'KUMAR N', '1SG16CS052', '52', 'CSE', '7A'),
('MADHURA ', 'K', '1SG16CS053', '53', 'CSE', '7A'),
('MAHERA ', 'ALAM', '1SG16CS054', '54', 'CSE', '7A'),
('MALLIKARJUN ', 'S C', '1SG16CS055', '55', 'CSE', '7A'),
('MANJUNATH ', 'S', '1SG16CS056', '56', 'CSE', '7A'),
('MANOJ ', 'R', '1SG16CS057', '57', 'CSE', '7A'),
('MEDHA ', 'MANSI', '1SG16CS058', '58', 'CSE', '7A'),
('MONICA ', 'M', '1SG16CS059', '59', 'CSE', '7A'),
('MUSKAN ', 'KEDIA', '1SG16CS060', '60', 'CSE', '7A'),
('NAVEEN ', 'K', '1SG16CS061', '61', 'CSE', '7A'),
('NIHARIKA', 'S', '1SG16CS062', '62', 'CSE', '7A'),
('NIKHIL ', 'GOWDA C', '1SG16CS063', '63', 'CSE', '7B'),
('PAVITHRA ', 'S', '1SG16CS067', '67', 'CSE', '7B'),
('PAYAL', '', '1SG16CS068', '68', 'CSE', '7B'),
('POOJA', 'VASANGIHAL', '1SG16CS069', '69', 'CSE', '7B'),
('PRAJWAL ', 'S V', '1SG16CS071', '71', 'CSE', '7B'),
('PRAKRITHI ', 'SINGH', '1SG16CS072', '72', 'CSE', '7B'),
('PRASHANTH ', 'M S', '1SG16CS073', '73', 'CSE', '7B'),
('PRIYA ', 'KUMARI', '1SG16CS074', '74', 'CSE', '7B'),
('PUNEETH ', 'KUMAR', '1SG16CS075', '75', 'CSE', '7B'),
('RADHIKA ', 'SINGHAL', '1SG16CS077', '77', 'CSE', '7B'),
('RAHUL ', 'KUMAR VERMA', '1SG16CS078', '78', 'CSE', '7B'),
('RAHUL ', 'PRABHU M', '1SG16CS079', '79', 'CSE', '7B'),
('RAJEEV ', 'SRINIVAS', '1SG16CS080', '80', 'CSE', '7B'),
('RAKHI ', 'KUMARI', '1SG16CS081', '81', 'CSE', '7B'),
('RAKSHITHA ', 'G', '1SG16CS082', '82', 'CSE', '7B'),
('RASHMI ', 'KUMARI', '1SG16CS083', '83', 'CSE', '7B'),
('RASHMI ', 'S P', '1SG16CS084', '84', 'CSE', '7B'),
('RASHMI ', 'SURYA', '1SG16CS085', '85', 'CSE', '7B'),
('RIBANSHU ', 'KESHRI', '1SG16CS087', '87', 'CSE', '7B'),
('ROHAN ', 'BIDAPPA A C', '1SG16CS088', '88', 'CSE', '7B'),
('SIDHEERAJ', '', '1SG16CS089', '89', 'CSE', '7B'),
('SACHINKUMAR ', 'S', '1SG16CS090', '90', 'CSE', '7B'),
('SALIL ', 'SANKRITYA', '1SG16CS091', '91', 'CSE', '7B'),
('SANTOSH ', 'JUNTPALLY', '1SG16CS094', '94', 'CSE', '7B'),
('SAURABH ', 'DOKANIYA', '1SG16CS095', '95', 'CSE', '7B'),
('SAURAV ', 'SIROHI', '1SG16CS096', '96', 'CSE', '7B'),
('SHANTANU ', 'PAWAR', '1SG16CS097', '97', 'CSE', '7B'),
('SHASHANK ', 'SHEKAR', '1SG16CS099', '99', 'CSE', '7B'),
('SHILPASHREE ', 'M C', '1SG16CS100', '100', 'CSE', '7B'),
('SHOBHA ', 'K', '1SG16CS101', '101', 'CSE', '7B'),
('SHRAVANI ', 'V', '1SG16CS102', '102', 'CSE', '7B'),
('SHREEVIDYA ', 'H S', '1SG16CS103', '103', 'CSE', '7B'),
('SINDHU ', 'R V', '1SG16CS104', '104', 'CSE', '7B'),
('SOUJITA  ', 'GHOSH', '1SG16CS105', '105', 'CSE', '7B'),
('SUJITH ', 'K M', '1SG16CS106', '106', 'CSE', '7B'),
('SUMAN ', 'R', '1SG16CS107', '107', 'CSE', '7B'),
('SURUCHI ', 'RANI', '1SG16CS108', '108', 'CSE', '7B'),
('SUSHMITHA ', 'B TANGADAGI', '1SG16CS109', '109', 'CSE', '7B'),
('SUSHMITHA ', 'M', '1SG16CS110', '110', 'CSE', '7B'),
('SWAPNA ', 'D', '1SG16CS111', '111', 'CSE', '7B'),
('TANMAY ', 'GUPTA', '1SG16CS112', '112', 'CSE', '7B'),
('TEJASHWINI ', 'C A', '1SG16CS113', '113', 'CSE', '7B'),
('TRIBHUVAN ', 'J M', '1SG16CS114', '114', 'CSE', '7B'),
('UDAYKIRAN ', 'S', '1SG16CS115', '115', 'CSE', '7B'),
('UJJWAL ', 'SHANKAR', '1SG16CS116', '116', 'CSE', '7B'),
('UNNATI ', 'GUPTA', '1SG16CS117', '117', 'CSE', '7B'),
('UVAIZ ', 'K H', '1SG16CS118', '118', 'CSE', '7B'),
('VATSALA ', 'PARMAR', '1SG16CS119', '119', 'CSE', '7B'),
('VIJAYA ', 'KUMAR S H', '1SG16CS120', '120', 'CSE', '7B'),
('VINEETHA ', 'RAVI KUMAR', '1SG16CS121', '121', 'CSE', '5A'),
('VISHWANATHA ', 'BHAT', '1SG16CS122', '122', 'CSE', '7B'),
('YASHASWINI ', 'J S', '1SG16CS123', '123', 'CSE', '7B'),
('YASHI ', 'SIKLIGAR', '1SG16CS124', '124', 'CSE', '7B'),
('RANJITA ', 'GANAPATI HEGDE', '1SG16CS125', '125', 'CSE', '7B'),
('NITIN ', 'MUNDHARA', '1SG16CS126', '126', 'CSE', '7B'),
('VIBHA ', 'M S', '1SG16CS127', '127', 'CSE', '7B'),
('SUNNY ', 'KUMAR SHARMA', '1SG16CS128', '128', 'CSE', '7B'),
('MADIHA ', 'AMBER A N', '1SG16CS129', '129', 'CSE', '7B'),
('NAVYA ', 'S', '1SG16CS130', '130', 'CSE', '7B'),
('PUNEETH ', 'A', '1SG16CS131', '131', 'CSE', '7B'),
('RANJINI ', 'R', '1SG16CS132', '', 'CSE', '7B'),
('SANJANA ', 'K', '1SG16CS133', '133', 'CSE', '7B'),
('TEJASWINI ', 'N R', '1SG16CS134', '134', 'CSE', '7B'),
('SAMREEN ', 'AZMI M', '1SG16CS135', '135', 'CSE', '7A'),
('KAVYA ', 'C', '1SG16CS136', '136', 'CSE', '7A'),
('SHWETHA', 'R', '1SG16CS137', '137', 'CSE', '7A'),
('SUHANA ', 'D', '1SG16CS138', '138', 'CSE', '7A'),
('VRUNDA ', 'C', '1SG16CS139', '139', 'CSE', '7A'),
('RAKSHITHA', '', '1SG16CS412', '412', 'CSE', '7B'),
('RAMYA ', 'R', '1SG16CS413', '413', 'CSE', '7B'),
('SWATHI ', 'H S', '1SG16CS418', '418', 'CSE', '7B'),
('AASIM ', 'INAMDAR', '1SG17CS001', '1', 'CSE', '5A'),
('ADNAN ', ' ANJUM ', '1SG17CS003', '3', 'CSE', '5A'),
('AFREEN', 'K', '1SG17CS004', '4', 'CSE', '5A'),
('AISHWARYA ', 'P', '1SG17CS005', '5', 'CSE', '5A'),
('AKASH ', 'KUMAR MAHAPATRA', '1SG17CS006', '6', 'CSE', '5A'),
('AKHILESH ', 'R MADHYASTHA', '1SG17CS007', '7', 'CSE', '5A'),
('AMAN ', 'PANDEY ', '1SG17CS008', '8', 'CSE', '5A'),
('AMAN ', 'VERMA', '1SG17CS009', '9', 'CSE', '5A'),
('AMIT ', 'N HEBBI', '1SG17CS010', '10', 'CSE', '5A'),
('ANANTHA ', 'KRISHNA', '1SG17CS011', '11', 'CSE', '5A'),
('ARJUN ', 'SINGH', '1SG17CS012', '12', 'CSE', '5A'),
('ARUN ', 'KUMAR S V', '1SG17CS013', '13', 'CSE', '5A'),
('AYAN ', 'BISWAS', '1SG17CS014', '14', 'CSE', '5A'),
('B ', 'PRASHANTH', '1SG17CS015', '15', 'CSE', '5A'),
('BHAGYASHREE ', 'B YARGAL', '1SG17CS016', '16', 'CSE', '5A'),
('BHARATH ', 'KUMAR R S', '1SG17CS017', '17', 'CSE', '5A'),
('BHARATHI ', 'J', '1SG17CS018', '18', 'CSE', '5A'),
('CHAITHANYA ', 'S', '1SG17CS019', '19', 'CSE', '5A'),
('CHANDAN ', 'PATIGE', '1SG17CS020', '20', 'CSE', '5A'),
('CHANDANA ', 'M', '1SG17CS021', '21', 'CSE', '5A'),
('DEEPA ', 'R M', '1SG17CS024', '24', 'CSE', '5A'),
('DHANASHREE', 'KULKARNI', '1SG17CS025', '25', 'CSE', '5A'),
('DILIP ', 'D M', '1SG17CS026', '26', 'CSE', '5A'),
('DIVYASHREE ', 'M S', '1SG17CS027', '27', 'CSE', '5A'),
('DYUTHISHREE', '', '1SG17CS028', '28', 'CSE', '5A'),
('FIRDOSE ', 'FATHIMA', '1SG17CS029', '29', 'CSE', '5A'),
('GANAVI ', 'R', '1SG17CS030', '30', 'CSE', '5A'),
('GANGA ', 'SAGAR H L', '1SG17CS031', '31', 'CSE', '5A'),
('GAURAV', 'KUMAR', '1SG17CS032', '32', 'CSE', '5A'),
('GAYATHRI ', ' S', '1SG17CS033', '33', 'CSE', '5A'),
('HARIPRIYA ', 'R K', '1SG17CS034', '34', 'CSE', '5A'),
('HARSHA ', 'H', '1SG17CS035', '35', 'CSE', '5A'),
('ISHA', 'BHAN', '1SG17CS036', '36', 'CSE', '5A'),
('JOVIN', 'DSOUZA', '1SG17CS037', '37', 'CSE', '5A'),
('K ', 'KAVITHA', '1SG17CS038', '38', 'CSE', '5A'),
('KARN ', 'KUMAR', '1SG17CS039', '39', 'CSE', '5A'),
('KAVYA', 'M HEGDE', '1SG17CS040', '40', 'CSE', '5A'),
('KAVYA ', ' S', '1SG17CS041', '41', 'CSE', '5A'),
('KHUSHBOO ', 'JAGWANI ', '1SG17CS042', '42', 'CSE', '5A'),
('KRUTHI', 'RAMESH ', '1SG17CS043', '43', 'CSE', '5A'),
('KUNAL ', 'P SANGURMATH', '1SG17CS044', '44', 'CSE', '5A'),
('LIKHITHA ', ' S R', '1SG17CS045', '45', 'CSE', '5A'),
('LOHITH ', 'B', '1SG17CS046', '46', 'CSE', '5A'),
('MAHIKA ', 'SINHA', '1SG17CS047', '47', 'CSE', '5A'),
('MANASA ', 'G', '1SG17CS048', '48', 'CSE', '5A'),
('MANAV ', ' PRADHAN', '1SG17CS049', '49', 'CSE', '5A'),
('MILIND ', 'MAHARANA', '1SG17CS051', '51', 'CSE', '5A'),
('NAINKAMALJEET ', 'SINGH', '1SG17CS052', '52', 'CSE', '5A'),
('NAKSHA ', 'MUTHAPPA M', '1SG17CS053', '53', 'CSE', '5A'),
('NIVEDITHA ', 'M P', '1SG17CS054', '54', 'CSE', '5B'),
('ONKARAMURTHY ', 'S K', '1SG17CS055', '55', 'CSE', '5B'),
('P ', 'AFREEN', '1SG17CS056', '56', 'CSE', '5B'),
('POOJA ', 'A S', '1SG17CS057', '57', 'CSE', '5B'),
('POOJA ', 'K R', '1SG17CS058', '58', 'CSE', '5B'),
('PRAJWAL ', 'SURESH', '1SG17CS059', '59', 'CSE', '5B'),
('PRAJWAL ', 'SHIVAKUMAR', '1SG17CS060', '60', 'CSE', '5B'),
('PRARTHANA ', 'NAIK', '1SG17CS061', '61', 'CSE', '5B'),
('RAHUL ', 'VERMA', '1SG17CS062', '62', 'CSE', '5B'),
('RAJ ', 'RANVEER', '1SG17CS063', '63', 'CSE', '5B'),
('RAJAT ', 'YADAV', '1SG17CS064', '64', 'CSE', '5B'),
('RASHI ', 'MAZUMDAR', '1SG17CS065', '65', 'CSE', '5B'),
('RISHIKESH ', 'SINGH', '1SG17CS066', '66', 'CSE', '5B'),
('RITIKA ', 'PANWAR', '1SG17CS067', '67', 'CSE', '5B'),
('HARSHITHA ', 'R K', '1SG17CS068', '68', 'CSE', '5A'),
('SACHIN', '', '1SG17CS069', '69', 'CSE', '5B'),
('SACHIN ', 'B R', '1SG17CS070', '70', 'CSE', '5B'),
('SAEED ', 'ANWAR', '1SG17CS071', '71', 'CSE', '5B'),
('SAHANA ', 'R YADAV', '1SG17CS072', '72', 'CSE', '5B'),
('SAHANA ', 'V', '1SG17CS073', '73', 'CSE', '5B'),
('SAKSHI ', '', '1SG17CS074', '74', 'CSE', '5B'),
('SALMAN ', 'KHAN ', '1SG17CS075', '75', 'CSE', '5B'),
('SARA ', 'KHATOON', '1SG17CS076', '76', 'CSE', '5B'),
('SHALINI ', 'T S', '1SG17CS077', '77', 'CSE', '5B'),
('SHARAN ', 'S', '1SG17CS078', '78', 'CSE', '5B'),
('SHASHIDHAR ', 'N N', '1SG17CS079', '79', 'CSE', '5B'),
('SHRUTI ', 'SINGH', '1SG17CS080', '80', 'CSE', '5B'),
('SHWETA ', 'SINGH', '1SG17CS082', '82', 'CSE', '5B'),
('SIDDHARTH ', 'SINGH', '1SG17CS083', '83', 'CSE', '5B'),
('SIDHANT ', 'KUMAR', '1SG17CS084', '84', 'CSE', '5B'),
('SOUNDARYA ', 'C', '1SG17CS086', '86', 'CSE', '5B'),
('SOWMYA ', 'R', '1SG17CS087', '87', 'CSE', '5B'),
('SPOORTHI IYENGAR', 'IYENGAR', '1SG17CS088', '88', 'CSE', '5B'),
('SPOORTHY ', 'I', '1SG17CS089', '89', 'CSE', '5B'),
('SREEPRIYA ', 'A', '1SG17CS090', '90', 'CSE', '5B'),
('SUDHAKAR', 'MISHRA', '1SG17CS091', '91', 'CSE', '5B'),
('SUKANYA ', 'C', '1SG17CS092', '92', 'CSE', '5B'),
('SWATHI', '', '1SG17CS094', '94', 'CSE', '5B'),
('UJJWAL ', 'KUMAR', '1SG17CS095', '95', 'CSE', '5B'),
('VAISHALI ', 'SONI ', '1SG17CS096', '96', 'CSE', '5B'),
('VAISHANAVI ', 'KASHYAP', '1SG17CS097', '97', 'CSE', '5B'),
('VARSHA ', 'C M', '1SG17CS098', '98', 'CSE', '5B'),
('VIKAS ', 'SHARMA', '1SG17CS099', '99', 'CSE', '5B'),
('VINAYAKA ', 'K M', '1SG17CS100', '100', 'CSE', '5B'),
('VIVEK ', 'MATHEW', '1SG17CS101', '101', 'CSE', '5B'),
('VRUSHANK ', 'DHEERENDRA RAO', '1SG17CS103', '103', 'CSE', '5B'),
('YASHASWINI ', 'C', '1SG17CS104', '104', 'CSE', '5B'),
('YASHASWI ', 'M', '1SG17CS105', '105', 'CSE', '5B'),
('DHRUVA ', 'K', '1SG17CS107', '107', 'CSE', '5B'),
('SAKSHI', '', '1SG17CS108', '108', 'CSE', '5B'),
('GAURI ', 'SHUKLA', '1SG17CS109', '109', 'CSE', '5A'),
('TEJASWINI', '', '1SG17CS110', '110', 'CSE', '5B'),
('POOJITHA ', 'U', '1SG17CS111', '111', 'CSE', '5B'),
('PALLAVI ', 'R', '1SG17CS112', '112', 'CSE', '5A'),
('AKARSH ', 'SINGH', '1SG17CS113', '113', 'CSE', '5B'),
('PRACHI', '', '1SG17CS114', '114', 'CSE', '5A'),
('PRIYA ', 'KUMARI', '1SG17CS115', '115', 'CSE', '5B'),
('C', 'MURALI GOPAL', '1SG17CS116', '116', 'CSE', '5A'),
('ABHISHEK ', 'KUMAR SHARMA', '1SG17CS117', '117', 'CSE', '5A'),
('MEGHANA ', 'N ', '1SG17CS118', '118', 'CSE', '5B'),
('RAMYA ', 'M', '1SG17CS119', '119', 'CSE', '5B'),
('SUKANYA ', 'N', '1SG17CS120', '120', 'CSE', '5A'),
('AJITH ', 'S', '1SG17CS400', '400', 'CSE', '7A'),
('ANJAL', ' D', '1SG17CS401', '401', 'CSE', '7A'),
('BHARATH ', 'KUMAR G', '1SG17CS402', '402', 'CSE', '7A'),
('BHAVYA ', 'V', '1SG17CS403', '403', 'CSE', '7A'),
('CHETHAN ', 'KUMAR G', '1SG17CS404', '404', 'CSE', '7A'),
('DARSHAN ', 'V D', '1SG17CS405', '405', 'CSE', '7A'),
('HARSHITHA ', 'BH', '1SG17CS406', '406', 'CSE', '7A'),
('HEMANTH ', 'KUMAR GR', '1SG17CS407', '407', 'CSE', '7A'),
('JAGADISH ', 'J', '1SG17CS408', '408', 'CSE', '7A'),
('MANU ', 'M C', '1SG17CS410', '410', 'CSE', '7B'),
('MEGHALA ', 'S', '1SG17CS411', '411', 'CSE', '7B'),
('NALINI ', 'J', '1SG17CS412', '412', 'CSE', '7B'),
('PRIYANKA ', 'D', '1SG17CS413', '413', 'CSE', '7B'),
('PUNITH ', 'KUMAR B N', '1SG17CS414', '414', 'CSE', '7B'),
('SHREELAKSHMI ', 'M M', '1SG17CS415', '415', 'CSE', '7B'),
('GUNARACHANA', 'A Y ', '1SG18CS001', '1', 'CSE', '3A'),
('AAKASH', 'WAZA', '1SG18CS002', '2', 'CSE', '3A'),
('ABDUL', 'HAROONKHAN', '1SG18CS003', '3', 'CSE', '3A'),
('ADARSH', 'B.G', '1SG18CS004', '4', 'CSE', '3A'),
('ADITYA', 'M', '1SG18CS005', '5', 'CSE', '3A'),
('ADITYA', 'SHARMA R', '1SG18CS006', '6', 'CSE', '3A'),
('ADITYA', 'SRIVASTAVA', '1SG18CS007', '7', 'CSE', '3A'),
('AKSHATHA', 'M', '1SG18CS009', '9', 'CSE', '3A'),
('AMANDEEP', 'SINGH', '1SG18CS010', '10', 'CSE', '3A'),
('ANKIT', 'RAJ', '1SG18CS011', '11', 'CSE', '3A'),
('ANUSHA ', 'D B', '1SG18CS012', '12', 'CSE', '3A'),
('APARNA ', 'SINGH', '1SG18CS013', '13', 'CSE', '3A'),
('APOORVA ', 'A ', '1SG18CS014', '14', 'CSE', '3A'),
('ARPITHA ', 'H K', '1SG18CS015', '15', 'CSE', '3A'),
('ARUNAKUMAR', '', '1SG18CS016', '16', 'CSE', '3A'),
('BHARGAV', 'TRIMAL KULKARNI', '1SG18CS017', '17', 'CSE', '3A'),
('BHOOMIKA', 'S', '1SG18CS018', '18', 'CSE', '3A'),
('BINDU', 'L', '1SG18CS020', '20', 'CSE', '3A'),
('DARSHAN', 'K S', '1SG18CS021', '21', 'CSE', '3A'),
('DEEPAK', 'B K', '1SG18CS023', '23', 'CSE', '3A'),
('DEEPAK', 'G', '1SG18CS024', '24', 'CSE', '3A'),
('DEEPAK', 'SHAH', '1SG18CS025', '25', 'CSE', '3A'),
('DEEPTHI', 'YADAV', '1SG18CS026', '26', 'CSE', '3A'),
('DEVASHISH', '', '1SG18CS027', '27', 'CSE', '3A'),
('DIVYANSHI ', 'KUSHWAHA', '1SG18CS028', '28', 'CSE', '3A'),
('FARAZ KHAN', 'KHAN', '1SG18CS029', '29', 'CSE', '3A'),
('FOUZIA', 'ANJUM', '1SG18CS030', '30', 'CSE', '3A'),
('GAURAV', 'GUPTA', '1SG18CS031', '31', 'CSE', '3A'),
('HARSH', 'KAVATEKAR', '1SG18CS032', '32', 'CSE', '3A'),
('HARSHIT', 'GUPTA', '1SG18CS033', '33', 'CSE', '3A'),
('HARSHITHA ', 'S', '1SG18CS034', '34', 'CSE', '3A'),
('HIMANI ', 'ADIGA', '1SG18CS035', '35', 'CSE', '3A'),
('JYOTHAPPAGARI', 'VYSHNAVI', '1SG18CS036', '36', 'CSE', '3A'),
('ANJALI', 'K U', '1SG18CS037', '37', 'CSE', '3A'),
('KOUSHIK ', 'V UPPULURI', '1SG18CS038', '38', 'CSE', '3A'),
('KUMARI ', 'MADHU', '1SG18CS039', '39', 'CSE', '3A'),
('LALIT', 'MUDGAL', '1SG18CS040', '40', 'CSE', '3A'),
('LIKITH ', 'S', '1SG18CS041', '41', 'CSE', '3A'),
('LAKSHMI ', 'NAVEEN REDDY', '1SG18CS042', '42', 'CSE', '3A'),
('MADHURI ', 'M K', '1SG18CS043', '43', 'CSE', '3A'),
('MALLIKARJUN ', 'V R', '1SG18CS044', '44', 'CSE', '3A'),
('MANDARA ', 'B', '1SG18CS045', '45', 'CSE', '3A'),
('MANGALA ', 'S', '1SG18CS046', '46', 'CSE', '3A'),
('MANISHA ', ' L', '1SG18CS047', '47', 'CSE', '3A'),
('MANJUNATH ', 'RAMA NAIK', '1SG18CS048', '48', 'CSE', '3A'),
('MANU ', 'K N', '1SG18CS049', '49', 'CSE', '3A'),
('MAYANK', '', '1SG18CS050', '50', 'CSE', '3A'),
('MEENA ', 'ALEKYA T', '1SG18CS051', '51', 'CSE', '3A'),
('MEGHA  ', 'P', '1SG18CS053', '53', 'CSE', '3A'),
('MEGHANA', 'G', '1SG18CS054', '54', 'CSE', '3A'),
('MOHIT ', ' KUMAR SHAW', '1SG18CS055', '55', 'CSE', '3A'),
('MOHIT ', 'VERMA', '1SG18CS056', '56', 'CSE', '3A'),
('MONIKA ', 'A', '1SG18CS057', '57', 'CSE', '3A'),
('MADHURAVANI', 'N', '1SG18CS059', '59', 'CSE', '3A'),
('NAMRATHA', '', '1SG18CS060', '60', 'CSE', '3A'),
('NIRANJAN S', '', '1SG18CS065', '65', 'CSE', '3B'),
('NISHANT ', 'RANA', '1SG18CS066', '66', 'CSE', '3B'),
('PALLAVI', ' R', '1SG18CS068', '68', 'CSE', '3B'),
('PANCHAMI ', 'A', '1SG18CS069', '69', 'CSE', '3B'),
('PARAMJEET ', 'SINGH', '1SG18CS070', '70', 'CSE', '3B'),
('PRANAV ', 'PARTH', '1SG18CS072', '72', 'CSE', '3B'),
('PRATIK ', 'N', '1SG18CS074', '74', 'CSE', '3B'),
('PREETHA ', 'S JOIS', '1SG18CS075', '75', 'CSE', '3B'),
('PREETHI ', 'U', '1SG18CS076', '76', 'CSE', '3B'),
('PREETHU ', 'T B', '1SG18CS077', '77', 'CSE', '3B'),
('PRERANA ', 'SHETTY', '1SG18CS078', '78', 'CSE', '3B'),
('PRIYANKA ', 'V', '1SG18CS079', '79', 'CSE', '3B'),
('PRIYANSHU ', 'KUMAR', '1SG18CS080', '80', 'CSE', '3B'),
('GOVARDHANA', '', '1SG18CS081', '81', 'CSE', '3B'),
('RAKESH ', 'S', '1SG18CS082', '82', 'CSE', '3B'),
('RASHMITHA ', 'V', '1SG18CS083', '83', 'CSE', '3B'),
('REVATHI', 'D', '1SG18CS084', '84', 'CSE', '3B'),
('RISHU ', 'RAJ', '1SG18CS085', '85', 'CSE', '3B'),
('RITIK ', 'SAINI', '1SG18CS086', '86', 'CSE', '3B'),
('ROHAN ', 'KUMAR', '1SG18CS087', '87', 'CSE', '3B'),
('ROHAN ', 'Y C', '1SG18CS088', '88', 'CSE', '3B'),
('ROHIT ', 'RAI', '1SG18CS089', '89', 'CSE', '3B'),
('ROOPA ', 'U', '1SG18CS090', '90', 'CSE', '3B'),
('ARPITHA ', 'V', '1SG18CS400', '400', 'CSE', '5A'),
('DARSHINI ', 'T G', '1SG18CS401', '401', 'CSE', '5B'),
('DHANALAKSHMI', '', '1SG18CS402', '402', 'CSE', '5A'),
('LAVANYA ', 'R', '1SG18CS403', '403', 'CSE', '5B'),
('RASHMITHA ', '', '1SG18CS404', '404', 'CSE', '5B');

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `logs` AFTER INSERT ON `student` FOR EACH ROW begin
insert into tfsi values(NEW.admin,NEW.semsec,NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teaching`
--

CREATE TABLE `teaching` (
  `empid` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `semsec` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaching`
--

INSERT INTO `teaching` (`empid`, `subject`, `semsec`) VALUES
('1SGE01', 'ATC', '5A'),
('1SGE01', 'ATC', '5B'),
('1SGE02', 'CN', '5A'),
('1SGE02', 'CN', '5B'),
('1SGE03', 'ML', '7A'),
('1SGE04', 'ML', '7B'),
('1SGE05', 'AI', '5B'),
('1SGE05', 'AI', '5A'),
('1SGE06', 'CNLAB', '5A'),
('1SGE06', 'CNLAB', '5B'),
('1SGE07', 'AJ', '5A'),
('1SGE07', 'AJ', '5B'),
('1SGE08', 'DS', '3A'),
('1SGE08', 'DS', '3B'),
('1SGE09', 'SE', '3A'),
('1SGE09', 'SE', '3B'),
('1SGE12', 'DBMS', '5A'),
('1SGE13', 'DBMS', '5B'),
('1SGE12', 'DBMSLAB', '5B'),
('1SGE13', 'DBMSLAB', '5A'),
('1SGE14', 'ME', '5A'),
('1SGE14', 'ME', '5B');

-- --------------------------------------------------------

--
-- Table structure for table `tfsi`
--

CREATE TABLE `tfsi` (
  `admin` varchar(20) NOT NULL,
  `semsec` varchar(3) NOT NULL,
  `inserted-time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tfsi`
--

INSERT INTO `tfsi` (`admin`, `semsec`, `inserted-time`) VALUES
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3A', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '3B', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5A', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:42'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '5B', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7A', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43'),
('CSE', '7B', '2019-11-01 21:06:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empid`),
  ADD KEY `admin` (`admin`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD KEY `admin` (`admin`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `admin` (`admin`),
  ADD KEY `empid` (`empid`),
  ADD KEY `usn` (`usn`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`),
  ADD KEY `admin` (`admin`);

--
-- Indexes for table `teaching`
--
ALTER TABLE `teaching`
  ADD KEY `empid` (`empid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `admin` (`user`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`admin`) REFERENCES `admin` (`user`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `admin` (`user`),
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`admin`) REFERENCES `admin` (`user`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `admin` (`user`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`),
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `admin` (`user`);

--
-- Constraints for table `teaching`
--
ALTER TABLE `teaching`
  ADD CONSTRAINT `teaching_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
