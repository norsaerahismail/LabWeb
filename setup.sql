-- Run this in phpMyAdmin or MySQL shell
-- Make sure you have already created database CSA3023

CREATE DATABASE IF NOT EXISTS CSA3023;
USE CSA3023;

CREATE TABLE IF NOT EXISTS userprofile (
    username   VARCHAR(15)  NOT NULL PRIMARY KEY,
    password   VARCHAR(10)  NOT NULL,
    firstname  VARCHAR(50)  NOT NULL,
    lastname   VARCHAR(50)  NOT NULL
);
