SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `bus_booking`
-- Table structure for table `booked`


CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Inserting data for table `booked` to show pre booked tickets by customers named diya, sejal, tamanna 
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '202009091727', 'Diya', 1, 1, '2020-09-09 10:29:44'),
(2, 1, '202009091626', 'Sejal', 2, 0, '2020-09-09 09:34:28'),
(3, 1, '202009099953', 'Tamanna', 20, 0, '2020-09-09 09:53:09'),
(4, 1, '202009099953', 'Tanya', 21, 0, '2020-09-09 09:53:09'),
(5, 1, '202079888953', 'Aashish', 3, 0, '2020-09-09 09:53:09'),
(6, 1, '202687778953', 'Arnav', 5, 0, '2020-09-09 09:53:09'),
(7, 1, '202001111953', 'Radhesh', 8, 0, '2020-09-09 09:53:09');


-- Table structure for table `bus`

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- data for table `bus`

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(1, 'AC', '5000', 1, '2020-09-08 13:54:42'),
(2, 'Sleeper','5001', 1, '2020-09-08 13:54:42'),
(3, 'Economy', '5002', 1, '2020-09-08 13:54:42');



-- Table structure for table `location`

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserting data for table `location` to show locations available

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, '01', 'Indore', 'M.P.', 1, '2020-09-08 14:23:36'),
(2, '02', 'Jaipur', 'Rajasthan', 1, '2020-09-08 14:33:04');
-- (3, '06', 'New Delhi', 'Delhi', 1, '2020-09-08 14:33:04');

-- Table structure for table `schedule_list`

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `schedule_list`

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 1, 1, 2, '2024-09-10 06:00:00', '2024-09-10 05:45:00', 1, 30, '1500', '2024-09-08 07:49:57'),
(2, 2, 1, 2, '2024-09-10 08:00:00', '2024-09-10 07:45:00', 1, 30, '800', '2024-09-08 07:37:52'),
(3, 3, 1, 2, '2024-09-10 10:00:00', '2024-09-10 09:45:00', 1, 30, '500', '2024-09-08 07:37:52'),
(4, 1, 2, 1, '2024-09-10 12:00:00', '2024-09-10 11:45:00', 1, 30, '1500', '2024-09-08 07:37:52'),
(5, 2, 2, 1, '2024-09-10 14:00:00', '2024-09-10 13:45:00', 1, 30, '900', '2024-09-08 07:37:52'),
(6, 3, 2, 1, '2024-09-10 16:00:00', '2024-09-10 15:45:00', 1, 30, '600', '2024-09-08 07:37:52'),

(7, 1, 1, 2, '2024-09-11 9:00:00', '2024-09-11 8:45:00', 1, 30, '1800', '2024-09-08 07:37:52'),
(8, 2, 1, 2, '2024-09-11 11:00:00', '2024-09-11 10:45:00', 1, 30, '1000', '2024-09-08 07:37:52'),
(9, 3, 1, 2, '2024-09-11 11:30:00', '2024-09-11 11:25:00', 1, 30, '700', '2024-09-08 07:37:52'),
(10, 1, 2, 1, '2024-09-11 12:00:00', '2024-09-11 11:45:00', 1, 30, '1200', '2024-09-08 07:37:52'),
(11, 2, 2, 1, '2024-09-11 15:00:00', '2024-09-11 14:45:00', 1, 30, '800', '2024-09-08 07:37:52'),
(12, 3, 2, 1, '2024-09-11 16:00:00', '2024-09-11 15:45:00', 1, 30, '300', '2024-09-08 07:37:52'),

(13, 1, 1, 2, '2024-09-12 12:00:00', '2024-09-12 11:45:00', 1, 30, '1800', '2024-09-08 07:37:52'),
(14, 2, 1, 2, '2024-09-12 17:00:00', '2024-09-12 16:45:00', 1, 30, '700', '2024-09-08 07:37:52'),
(15, 3, 1, 2, '2024-09-12 19:00:00', '2024-09-12 18:45:00', 1, 30, '400', '2024-09-08 07:37:52'),
(16, 1, 2, 1, '2024-09-12 21:00:00', '2024-09-12 20:50:00', 1, 30, '1500', '2024-09-08 07:49:57'),
(17, 2, 2, 1, '2024-09-12 21:30:00', '2024-09-12 21:20:00', 1, 30, '1000', '2024-09-08 07:49:57');
	
--  AC SLEEPER ECO bus available on 10th 11th 12th sep

-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = admin, 2= faculty , 3 = student',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Inserting data for table `users` to define who are allowed to login
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Rishi sir', 1, 'rishi sir', 'project', 1, '2020-09-08 16:42:28'),
(2, 'Anjali maam', 1, 'anjali maam', 'project', 1, '2020-09-08 16:13:53');


ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
