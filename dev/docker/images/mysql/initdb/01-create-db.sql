# Create Databases
CREATE DATABASE IF NOT EXISTS `magento_db`;

# Create user and grant rights
FLUSH PRIVILEGES;
CREATE USER 'vinhmh'@'%' IDENTIFIED BY 'vinhpro1298';
GRANT ALL ON magento_db.* TO 'vinhmh'@'%';
