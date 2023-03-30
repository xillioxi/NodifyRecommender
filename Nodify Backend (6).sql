CREATE TABLE `User` (
  `id` int PRIMARY KEY,
  `username` varchar(255),
  `password` varchar(255),
  `homeAddress1` varchar(255),
  `homeAddress2` varchar(255),
  `zipcode` int,
  `countryCode` int,
  `phonenumber` int,
  `country` int,
  `joinedDate` date
);

CREATE TABLE `Country` (
  `id` int PRIMARY KEY,
  `countryName` varchar(255),
  `CountryCode` int
);

CREATE TABLE `Business` (
  `id` int PRIMARY KEY,
  `userID` int,
  `Address` varchar(255),
  `name` varchar(255),
  `established` date,
  `region` varchar(255),
  `zipCode` int,
  `AddressLine2` varchar(255),
  `amountEmployees` int,
  `areaCode` int
);

CREATE TABLE `PaymentInfo` (
  `id` int PRIMARY KEY,
  `userID` int,
  `paymentType` varchar(255),
  `number` int
);

CREATE TABLE `Payment` (
  `id` int PRIMARY KEY,
  `userID` int,
  `receiver` varchar(255),
  `paymentType` varchar(255),
  `purpose` varchar(255),
  `transactionAmount` int,
  `transactionDate` date,
  `success` boolean
);

CREATE TABLE `Performance` (
  `id` int PRIMARY KEY,
  `businessID` int,
  `revenue` int,
  `workload` int,
  `visitors` int
);

CREATE TABLE `Product` (
  `id` int PRIMARY KEY,
  `userID` int,
  `productName` varchar(255),
  `productBrand` varchar(255),
  `text` varchar(255)
);

CREATE TABLE `ProductPhoto` (
  `id` int PRIMARY KEY,
  `productID` int,
  `productLink` varchar(255),
  `uploadDate` date
);

CREATE TABLE `Process` (
  `id` int PRIMARY KEY,
  `performanceID` int,
  `Revenue` int,
  `Workload` int,
  `Visitors` int
);

ALTER TABLE `User` ADD FOREIGN KEY (`country`) REFERENCES `Country` (`id`);

ALTER TABLE `Business` ADD FOREIGN KEY (`userID`) REFERENCES `User` (`id`);

ALTER TABLE `PaymentInfo` ADD FOREIGN KEY (`userID`) REFERENCES `User` (`id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`userID`) REFERENCES `User` (`id`);

ALTER TABLE `Performance` ADD FOREIGN KEY (`businessID`) REFERENCES `Business` (`id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`userID`) REFERENCES `User` (`id`);

ALTER TABLE `ProductPhoto` ADD FOREIGN KEY (`productID`) REFERENCES `Product` (`id`);

ALTER TABLE `Process` ADD FOREIGN KEY (`performanceID`) REFERENCES `Performance` (`id`);
