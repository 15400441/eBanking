/*
MySQL Data Transfer
Source Host: localhost
Source Database: ebank
Target Host: localhost
Target Database: ebank
Date: 2015/11/27 20:56:05
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for account
-- ----------------------------
CREATE TABLE `account` (
  `id` bigint(38) NOT NULL AUTO_INCREMENT,
  `accNo` varchar(25) NOT NULL,
  `currType` varchar(3) NOT NULL,
  `accType` varchar(3) DEFAULT NULL,
  `accAlias` varchar(50) DEFAULT NULL,
  `accStatus` varchar(10) DEFAULT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `cusId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cusId` (`cusId`),
  KEY `accNo` (`accNo`),
  CONSTRAINT `cusId` FOREIGN KEY (`cusId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bank
-- ----------------------------
CREATE TABLE `bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankNo` varchar(30) NOT NULL,
  `bankName` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bankNo` (`bankNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for card
-- ----------------------------
CREATE TABLE `card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Status` varchar(2) DEFAULT NULL,
  `cardNo` varchar(20) NOT NULL,
  `type` varchar(2) DEFAULT NULL,
  `accId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  CONSTRAINT `accId` FOREIGN KEY (`accId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
CREATE TABLE `customer` (
  `id` bigint(38) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phoneNum` varchar(20) NOT NULL,
  `credentialType` varchar(2) DEFAULT NULL,
  `credentialNo` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tablefieldref
-- ----------------------------
CREATE TABLE `tablefieldref` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tableField` varchar(50) NOT NULL,
  `code` varchar(4) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transfer
-- ----------------------------
CREATE TABLE `transfer` (
  `id` bigint(38) NOT NULL AUTO_INCREMENT,
  `tranNo` varchar(36) NOT NULL,
  `customerId` varchar(38) NOT NULL,
  `tranType` char(1) DEFAULT NULL,
  `tranStatus` varchar(2) DEFAULT NULL,
  `accOutNo` varchar(38) DEFAULT NULL,
  `accInNo` varchar(38) DEFAULT NULL,
  `currType` varchar(3) DEFAULT NULL,
  `tranLevel` varchar(3) DEFAULT NULL,
  `tranDate` date DEFAULT NULL,
  `tranAmount` decimal(10,0) DEFAULT NULL,
  `tranUse` varchar(20) DEFAULT NULL,
  `inBankNo` varchar(20) DEFAULT NULL,
  `outBankNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inBankNo` (`inBankNo`),
  KEY `outBankNo` (`outBankNo`),
  KEY `accOutNo` (`accOutNo`),
  CONSTRAINT `accOutNo` FOREIGN KEY (`accOutNo`) REFERENCES `account` (`accNo`),
  CONSTRAINT `inBankNo` FOREIGN KEY (`inBankNo`) REFERENCES `bank` (`bankNo`),
  CONSTRAINT `outBankNo` FOREIGN KEY (`outBankNo`) REFERENCES `bank` (`bankNo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `cusId` bigint(20) NOT NULL,
  `openDate` date NOT NULL,
  `status` char(1) NOT NULL,
  `tipNote` varchar(64) DEFAULT NULL,
  `loginTimes` int(11) DEFAULT NULL,
  `lastLoginTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cusId_id` (`cusId`),
  CONSTRAINT `cusId_id` FOREIGN KEY (`cusId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `account` VALUES ('1', '123', '0', '1', 'duan', '0', '296200', '1');
INSERT INTO `account` VALUES ('2', '321', '0', '1', 'zhang', '0', '303800', '2');
INSERT INTO `account` VALUES ('3', '1234', '0', '1', 'zhou', '1', '200000', '3');
INSERT INTO `bank` VALUES ('1', '110', '腾龙银行');
INSERT INTO `bank` VALUES ('2', '111', '中国银行');
INSERT INTO `bank` VALUES ('3', '112', '华夏银行');
INSERT INTO `bank` VALUES ('4', '113', 'HSBC');
INSERT INTO `card` VALUES ('1', '0', '6222021405004201236', '0', '1');
INSERT INTO `card` VALUES ('2', '0', '6222021405004207456', '0', '2');
INSERT INTO `customer` VALUES ('1', 'duan', '23', 'male', 'ntt', 'd', 'duansheng00@163.com', '1', '0', '1');
INSERT INTO `customer` VALUES ('2', 'zhang', '25', 'female', 'putian', 'd', 'duansheng00@163.com', '1', '0', '1');
INSERT INTO `customer` VALUES ('3', 'zhou', '46', 'female', 'xinyang', 'd', null, '1', '0', '1');
INSERT INTO `tablefieldref` VALUES ('1', 'customer_gender', '1', '女');
INSERT INTO `tablefieldref` VALUES ('2', 'user_status', '0', '正常');
INSERT INTO `tablefieldref` VALUES ('3', 'user_status', '1', '挂起');
INSERT INTO `tablefieldref` VALUES ('4', 'user_status', '2', '消户');
INSERT INTO `tablefieldref` VALUES ('5', 'user_status', '3', '锁定');
INSERT INTO `tablefieldref` VALUES ('6', 'transfer_tranType', '0', '行内及时转账');
INSERT INTO `tablefieldref` VALUES ('7', 'transfer_tranType', '1', '行内预约转账');
INSERT INTO `tablefieldref` VALUES ('8', 'transfer_tranType', '2', '跨行及时转账');
INSERT INTO `tablefieldref` VALUES ('9', 'cusomer_gender', '0', '男');
INSERT INTO `tablefieldref` VALUES ('10', 'transfer_tranStatus', '0', '成功');
INSERT INTO `tablefieldref` VALUES ('11', 'transfer_tranStatus', '1', '失败');
INSERT INTO `tablefieldref` VALUES ('12', '_currType', '0 ', '人民币');
INSERT INTO `tablefieldref` VALUES ('13', '_currType', '1', '港币');
INSERT INTO `tablefieldref` VALUES ('14', '_currType', '2', '美元');
INSERT INTO `tablefieldref` VALUES ('15', 'account_accType', '1', '活期');
INSERT INTO `tablefieldref` VALUES ('16', 'account_accType', '0', '定期');
INSERT INTO `tablefieldref` VALUES ('17', 'account_Status', '0', '正常');
INSERT INTO `tablefieldref` VALUES ('18', 'account_Status', '1', '锁定');
INSERT INTO `tablefieldref` VALUES ('19', 'account_Status', '2', '注销');
INSERT INTO `tablefieldref` VALUES ('20', 'customer_credentialType', '0', '身份证');
INSERT INTO `tablefieldref` VALUES ('21', 'customer_credentialType', '1', '军官证');
INSERT INTO `tablefieldref` VALUES ('22', 'customer_credentialType', '2', '护照');
INSERT INTO `tablefieldref` VALUES ('23', 'card_status', '0', '正常');
INSERT INTO `tablefieldref` VALUES ('24', 'card_status', '1', '锁定');
INSERT INTO `tablefieldref` VALUES ('25', 'card_status', '2', '注销');
INSERT INTO `tablefieldref` VALUES ('26', 'card_type', '0', '借记卡');
INSERT INTO `tablefieldref` VALUES ('27', 'card_type', '1', '信用卡');
INSERT INTO `transfer` VALUES ('2', 'd5d578ef022a45549ac9bd025a7fb8f4', '2', '0', '0', '123', '321', '0', '', '2015-11-17', '1000', null, '110', null);
INSERT INTO `transfer` VALUES ('3', '8e7d238aea79499eb23e028702e9ea0c', '1', '0', '0', '321', '123', '0', '', '2015-11-17', '1000', null, '110', null);
INSERT INTO `transfer` VALUES ('4', 'b18942abb66842e19531b4cb6e33bcb4', '1', '0', '0', '321', '123', '0', '', '2015-11-17', '1000', null, '110', null);
INSERT INTO `transfer` VALUES ('5', '541baab7fb9d429e9fcb35cacc44e66c', '2', '0', '0', '123', '321', '0', '', '2015-11-18', '1000', null, '110', null);
INSERT INTO `transfer` VALUES ('6', '5487fc7b22074182af5a212081177b3a', '2', '0', '0', '123', '321', '0', '', '2015-11-20', '1200', null, '110', null);
INSERT INTO `transfer` VALUES ('7', 'd11b0dafbf0848cbb4bd9d8aeede7ece', '2', '0', '0', '123', '321', '0', '', '2015-11-20', '1200', null, '110', null);
INSERT INTO `transfer` VALUES ('8', '58769be3184e4658bd507fbbdf438c02', '2', '0', '0', '123', '321', '0', '', '2015-11-20', '100', null, '110', null);
INSERT INTO `transfer` VALUES ('9', '94c424f585d54ba18f580439ad4a416f', '2', '0', '0', '123', '321', '0', '', '2015-11-27', '600', null, '110', null);
INSERT INTO `transfer` VALUES ('10', 'ff7e641c0fd84cdaad0bf9eb62dfa632', '2', '0', '0', '123', '321', '0', '', '2015-11-27', '200', null, '110', null);
INSERT INTO `transfer` VALUES ('11', '25b6f794eca140c59a4816da575b07c5', '2', '0', '0', '123', '321', '0', '', '2015-11-27', '200', null, '110', null);
INSERT INTO `transfer` VALUES ('12', '8f33d3e449d846a9b7dbb3e82b6ab6ba', '2', '0', '0', '123', '321', '0', '', '2015-11-27', '300', null, '110', null);
INSERT INTO `user` VALUES ('1', 'a', '0cc175b9c0f1b6a831c399e269772661', '1', '2015-11-07', '1', null, null, '2015-11-27');
INSERT INTO `user` VALUES ('2', 'b', '92eb5ffee6ae2fec3ad71c777531578f', '2', '2015-11-25', '1', null, null, '2015-11-27');
