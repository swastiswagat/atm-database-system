create database project1;
use project1;

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `Account_number` int(10) NOT NULL AUTO_INCREMENT,
  `Balance` int(50) NOT NULL,
  `Account_type` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`Account_number`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `Balance` (`Balance`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=latin1;

INSERT INTO `account` (`Account_number`, `Balance`, `Account_type`, `user_id`) VALUES
(1000, 55000, 'savings', 100),
(1001, 10900, 'current', 101),
(1002, 19200, 'savings', 102),
(1003, 11200, 'current', 103),
(1004, 103200, 'savings', 104),
(1005, 79200, 'savings', 105),
(1006, 4000, 'savings', 106),
(1007, 47042, 'savings', 107),
(1008, 52200, 'current', 108),
(1009, 58200, 'savings', 109);

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_pin` int(11) NOT NULL,
  `atm_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `atm_id` (`atm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`admin_id`, `admin_pin`, `atm_id`) VALUES
(500, 1122, 120),
(501, 2244, 121),
(502, 5566, 122),
(503, 7890, 123),
(504, 9810, 124),
(505, 1999, 125),
(506, 1887, 126),
(507, 4596, 127),
(508, 8988, 128),
(509, 9999, 129);

DROP TABLE IF EXISTS `atm`;
CREATE TABLE IF NOT EXISTS `atm` (
  `atm_id` int(11) NOT NULL,
  `atm_location` varchar(255) NOT NULL,
  `available_cash` int(11) NOT NULL,
  PRIMARY KEY (`atm_id`),
  KEY `atm_id` (`atm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `atm` (`atm_id`, `atm_location`, `available_cash`) VALUES
(120, 'Paradeep', 80000),
(121, 'RR Nagar', 150000),
(122, 'Saheed nagar', 70000),
(123, 'Baxi bazar', 20000),
(124, 'Nuabzar', 80000),
(125, 'Madhuban', 80000),
(126, 'Indranagara', 70000),
(127, 'Jayanagar', 100000),
(128, 'Kumarswamy Layout', 100500),
(129, 'Kakatpur', 70000);

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `Bank_name` varchar(255) NOT NULL,
  `Bank_id` int(11) NOT NULL,
  `Branch_Location` varchar(255) NOT NULL,
  `account` int(11) NOT NULL,
  PRIMARY KEY (`Bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bank` (`Bank_name`, `Bank_id`, `Branch_Location`, `account`) VALUES
('IDBI Bank', 1, 'Paradeep', 1000),
('Canara Bank', 2, 'Nayabazr Layout', 1001),
('HDFC Bank', 3, 'JP Nagar', 1002),
('State Bank of India', 4, 'Jayanagar', 1003),
('Bank of Baroda', 5, 'Brundaban colony', 1004),
('Bank of India', 6, 'Gandhi Bazar', 1005),
('Indian bank', 7, 'Neherubagala', 1006),
('Punjab National Bnak', 8, 'NR Colony', 1007);

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `card_no` int(11) NOT NULL,
  `card_pin` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`card_no`),
  KEY `balance` (`balance`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `card` (`card_no`, `card_pin`, `balance`, `user_id`) VALUES
(123456, 9001, 79200, 105),
(123965, 9110, 55000, 109),
(145672, 1837, 55000, 100),
(312315, 4142, 11200, 103),
(423415, 1312, 19200, 102),
(456789, 1002, 4000, 106),
(512345, 1131, 10900, 101),
(765345, 4810, 52200, 108),
(914321, 8198, 103200, 104),
(987651, 1113, 47042, 107);

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `balance` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO `logs` (`id`, `user_id`, `balance`, `created_date`) VALUES
(1, 100, '60400', '2023-11-14 10:26:44'),
(2, 100, '60200', '2023-11-14 10:28:26'),
(3, 100, '60000', '2023-11-14 10:59:18'),
(4, 100, '59000', '2023-11-14 13:40:20'),
(5, 100, '58200', '2023-11-14 13:45:22'),
(6, 101, '700', '2023-11-14 13:47:01'),
(7, 101, '-100', '2023-11-14 13:47:23'),
(8, 101, '10000', '2023-11-14 13:48:02'),
(9, 101, '9900', '2023-11-14 13:50:13'),
(10, 101, '10400', '2023-11-14 13:53:26'),
(11, 100, '57700', '2023-11-14 13:53:26'),
(12, 101, '10500', '2023-11-14 13:56:40'),
(13, 100, '57600', '2023-11-14 13:56:40'),
(14, 100, '57400', '2023-11-14 14:48:47'),
(15, 101, '10600', '2023-11-14 14:49:52'),
(16, 100, '57300', '2023-11-14 14:49:53'),
(17, 101, '10700', '2023-11-14 14:50:22'),
(18, 100, '57200', '2023-11-14 14:50:22'),
(19, 100, '56200', '2023-11-29 11:05:36'),
(20, 101, '10800', '2023-12-03 06:43:14'),
(21, 100, '56100', '2023-12-03 06:43:14'),
(22, 100, '55100', '2023-12-03 11:10:42'),
(23, 101, '10900', '2023-12-03 11:13:19'),
(24, 100, '55000', '2023-12-03 11:13:20');

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `transaction_date` date NOT NULL,
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_status` varchar(255) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `transaction` (`transaction_date`, `transaction_id`, `transaction_status`, `transaction_type`, `user_id`) VALUES
('2023-11-10', 1, 'Successful', 'savings', 108),
('2023-11-14', 2, 'Successful', 'Savings', 100),
('2023-10-17', 3, 'Successful', 'current', 101),
('2023-10-18', 4, 'Failed', 'savings', 102),
('2023-09-14', 5, 'Successful', 'current', 103),
('2023-10-18', 6, 'Failed', 'Savings', 104),
('2023-11-13', 7, 'Successful', 'savings\r\n', 105),
('2023-10-28', 8, 'Failed', 'current', 106),
('2023-11-10', 9, 'Successful', 'savings', 107);

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` int(11) NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `address`, `contact_no`, `DOB`) VALUES
(100, 'Ravi', 'Kumar', 'Bengaluru', 998456789, '1997-01-21'),
(101, 'Pramod', 'Sahoo', 'Managaluru', 816345678, '1981-03-13'),
(102, 'Rashmi', 'Nayak', 'Delhi', 742356819, '1981-02-21'),
(103, 'Jagadish', 'Behera', 'Jagatsinghpur', 923645789, '1991-04-04'),
(104, 'Bedaprakash', 'Swain', 'Paradeep', 886115575, '1996-05-18'),
(105, 'Ayush ashutosh', 'rath', 'Puri', 776255848, '1999-06-29'),
(106, 'Rama', 'Muduli', 'Kakatpur', 996118117, '1979-07-01'),
(107, 'Hari', 'Sahu', 'Oskana', 702260405, '1999-11-13'),
(108, 'Pavan', 'Kumar', 'Mumbai', 809260405, '1976-08-02'),
(109, 'Chirag', 'Nayak', 'Chennai', 812345923, '1977-09-03');