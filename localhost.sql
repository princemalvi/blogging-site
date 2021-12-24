-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 19, 2021 at 12:14 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `freeblogger`
--
CREATE DATABASE `freeblogger` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `freeblogger`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(40) NOT NULL,
  `adminpassword` varchar(30) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `adminpassword`) VALUES
(1, 'prince@gmail.com', 'prince123');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE IF NOT EXISTS `blogs` (
  `blogid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `category` varchar(20) NOT NULL,
  `blog` text NOT NULL,
  `userid` int(11) NOT NULL,
  `posteddate` datetime NOT NULL,
  `status` char(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blogid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blogid`, `title`, `category`, `blog`, `userid`, `posteddate`, `status`) VALUES
(1, 'Features of C Language', 'C Programming', 'C is the widely used language. It provides many features that are given below.      Simple     Machine Independent or Portable     Mid-level programming language     structured programming language     Rich Library     Memory Management     Fast Speed     Pointers     Recursion     Extensible', 3, '2021-12-18 02:04:02', '2'),
(3, 'Variables in C', 'C Programming', 'A variable is a name of the memory location. It is used to store data. Its value can be changed, and it can be reused many times.\n\nIt is a way to represent memory location through symbol so that it can be easily identified.\n\nLet''s see the syntax to declare a variable:\n\n    type variable_list;Â Â ', 3, '2021-12-18 17:31:20', '1'),
(5, 'First C Program', 'C Programming', '<p>#include&lt;stdio.h&gt;<br data-mce-bogus="1"></p><p>void main(){<br data-mce-bogus="1"></p><p style="padding-left: 40px;" data-mce-style="padding-left: 40px;">printf("Hello world");<br data-mce-bogus="1"></p><p style="">}<br data-mce-bogus="1"></p><p><br data-mce-bogus="1"></p>', 3, '2021-12-18 18:19:04', '1');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE IF NOT EXISTS `follow` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `followuser` int(11) NOT NULL,
  `followby` int(11) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`fid`, `followuser`, `followby`) VALUES
(5, 3, 4),
(6, 4, 3),
(7, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `likeid` int(11) NOT NULL AUTO_INCREMENT,
  `blogid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`likeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `likes`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(40) NOT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `profile` varchar(70) DEFAULT NULL,
  `dateregistered` date NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `email`, `password`, `username`, `bio`, `profile`, `dateregistered`) VALUES
(4, 'nikhil096@gmail.com', 'nikhil096', 'Nikhil96', 'I am good in Android App Development', NULL, '2021-12-18'),
(3, 'princemalvi097@gmail.com', 'princemalvi097', 'Prince97', 'I am good in c programming\r\n', 'dog.jpg', '2021-12-18'),
(5, 'rahul095@gmail.com', 'rahul095', 'Rahul95', 'I am a good in ML', NULL, '2021-12-19'),
(6, 'akash94@gmail.com', 'akash094', 'Akash94', 'I am Good In CS', NULL, '2021-12-19'),
(8, 'poojan93@gmail.com', 'poojan93', 'Poojan93', 'I am good web Designer', NULL, '2021-12-20');
