CREATE DATABASE HMMS;
USE HMMS;

CREATE TABLE MEMBER (
    MEMBER_ID 		VARCHAR(20) PRIMARY KEY,
    PASSWD 			VARCHAR(100) NOT NULL,
	MEMBER_NM 		VARCHAR(20)  NOT NULL,
	SEX 			CHAR(1)  	 NOT NULL,
	BIRTH_DT 		CHAR(10)     NOT NULL, 
	HP 				VARCHAR(13)  NOT NULL,
	SMSSTS_YN 		CHAR(1)   	 NOT NULL,
	EMAIL 			VARCHAR(30)  NOT NULL,
	EMAILSTS_YN 	CHAR(1)   	 NOT NULL,
	ZIPCODE 		VARCHAR(10),
	ROAD_ADDRESS 	VARCHAR(200),
	JIBUN_ADDRESS 	VARCHAR(200),
	NAMUJI_ADDRESS 	VARCHAR(200),
	JOIN_DT 		TIMESTAMP,
	POINT 			INT,
    AUTHORITY_WT    VARCHAR(20)
);

CREATE TABLE `ADMIN`(
    ADMIN_ID 	VARCHAR(20) PRIMARY KEY,
	PASSWD 		VARCHAR(100),
	JOIN_DT 	TIMESTAMP
);

INSERT INTO `ADMIN` VALUES ('admin' , '1234' , NOW());



CREATE TABLE GOODS(
    PRODUCT_CD 		  INT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_NM 		  VARCHAR(300),
	PRICE 			  INT,
	DISCOUNT_RT 	  INT,
	SORT 			  VARCHAR(10),
	POINT 			  INT,
	DELIVERY_PRICE 	  INT,
	PART 			  VARCHAR(20),
    PRODUCT_FILE_NAME   VARCHAR(300),
    INTRO 			  VARCHAR(300),
	ENROLL_DT 		  DATETIME
);


CREATE TABLE `ORDER`(
	ORDER_CD 			BIGINT AUTO_INCREMENT PRIMARY KEY,
    MEMBER_ID 			VARCHAR(20),
    PRODUCT_CD 			INT,
	ORDER_GOODS_QTY 	INT,
	PAYMENT_AMT			INT,
    ORDERER_NM 			VARCHAR(50),
    ORDERER_HP 			VARCHAR(50),
	RECEIVER_NM 		VARCHAR(50),
	RECEIVER_HP 		VARCHAR(20),
	ZIPCODE 			VARCHAR(20),
	ROAD_ADDRESS 		VARCHAR(200),
	JIBUN_ADDRESS 		VARCHAR(200),
	NAMUJI_ADDRESS 		VARCHAR(200),
    DELIVERY_METHOD 	VARCHAR(40),
    DELIVERY_MESSAGE 	VARCHAR(300),
    DELIVERY_STATUS 	VARCHAR(100),
	GIFT_WRAPPING 		VARCHAR(1),
	PAY_METHOD 			VARCHAR(200),
	PAY_ORDERER_HP 		VARCHAR(50), 
	CARD_COMPANY_NM 	VARCHAR(50),
	CARD_PAY_MONTH 		VARCHAR(20),
    PAY_ORDER_TIME 		DATETIME
);

CREATE TABLE CART(
	CART_CD   		BIGINT AUTO_INCREMENT PRIMARY KEY,
    MEMBER_ID 		VARCHAR(20),
    PRODUCT_CD 		INT,
    ORDER_GOODS_QTY INT,
    ENROLL_DT 		TIMESTAMP
);

CREATE TABLE CONTACT (
	CONTACT_CD  INT AUTO_INCREMENT PRIMARY KEY,
    MEMBER_ID 	VARCHAR(30),
	NAME		VARCHAR(30),								
	EMAIL		VARCHAR(30),					
	SUBJECT		VARCHAR(300),					
	CONTENT		VARCHAR(3000),					
	REG_DT  	TIMESTAMP,						
    ADMIN_REPLY 	VARCHAR(3000)
);