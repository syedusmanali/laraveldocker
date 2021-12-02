DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `id`            int(11) NOT NULL,
    `category_name` varchar(200) NOT NULL,
    `created_by`    varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental_category`
--

INSERT INTO `category` (`id`, `category_name`, `created_by`)
VALUES (1, 'Apartment', 'Test name'),
       (2, 'House', 'Test name'),
       (3, 'Lower Portion', 'Test name'),
       (4, 'Upper Portion', 'Test name'),
       (5, 'Guest House', 'Test name');
