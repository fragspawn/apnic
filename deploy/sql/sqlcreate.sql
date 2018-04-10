-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2018 at 04:08 AM
-- Server version: 10.2.13-MariaDB
-- PHP Version: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS apnic;
CREATE DATABASE apnic;
USE apnic;

--
-- Database: apnic
--

-- --------------------------------------------------------

--
-- Table structure for table acns
--

DROP TABLE IF EXISTS asns;
CREATE TABLE asns (
  one varchar(64) NOT NULL,
  two varchar(64) NOT NULL,
  three varchar(64) NOT NULL,
  four varchar(64) NOT NULL,
  five int(11) NOT NULL,
  six int(11) NOT NULL,
  seven varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

