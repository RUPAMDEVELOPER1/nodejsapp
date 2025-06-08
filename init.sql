CREATE DATABASE IF NOT EXISTS storedb;

-- Drop user if exists to avoid conflicts
DROP USER IF EXISTS 'prod_user'@'%';

-- Create user with explicit authentication
CREATE USER 'prod_user'@'%' IDENTIFIED WITH mysql_native_password BY 'rupam7499';

-- Grant all privileges
GRANT ALL PRIVILEGES ON storedb.* TO 'prod_user'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'prod_user'@'%';
FLUSH PRIVILEGES;

USE storedb;

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some test data
INSERT INTO products (name, description, price) VALUES 
('Test Product 1', 'A test product', 99.99),
('Test Product 2', 'Another test product', 149.99);