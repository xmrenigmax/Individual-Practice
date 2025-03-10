-- First, let's create the required tables
CREATE TABLE user_account (
    user_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50)
);

CREATE TABLE customer (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50)
);

CREATE TABLE contact (
    contact_id NUMBER PRIMARY KEY,
    user_account_id NUMBER,
    customer_id NUMBER,
    contact_date DATE,
    FOREIGN KEY (user_account_id) REFERENCES user_account(user_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Query to find pairs with multiple contacts
SELECT 
    ua.user_id,
    ua.first_name,
    ua.last_name,
    c.customer_id,
    cu.customer_name,
    COUNT(*) as contact_count
FROM user_account ua
JOIN contact c ON ua.user_id = c.user_account_id
JOIN customer cu ON c.customer_id = cu.customer_id
GROUP BY 
    ua.user_id,
    ua.first_name,
    ua.last_name,
    c.customer_id,
    cu.customer_name
HAVING COUNT(*) > 1
ORDER BY ua.user_id ASC;