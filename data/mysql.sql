CREATE DATABASE IF NOT EXISTS slack_db;
USE slack_db;

-- Users Table
CREATE TABLE IF NOT EXISTS user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100),
    avatar_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_by BIGINT DEFAULT NULL,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Conversations Table
CREATE TABLE IF NOT EXISTS conversation (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    sender_id BIGINT NOT NULL,
    receiver_id BIGINT NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_by BIGINT DEFAULT NULL,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES user(id) ON DELETE CASCADE
);

-- Insert Dummy Users
INSERT INTO user (username, email, full_name, avatar_url, is_active, is_deleted, deleted_by, deleted_at) VALUES
('john_doe', 'john@example.com', 'John Doe', 'https://example.com/john.jpg', TRUE, FALSE, NULL, NULL),
('jane_smith', 'jane@example.com', 'Jane Smith', 'https://example.com/jane.jpg', TRUE, FALSE, NULL, NULL),
('mike_jones', 'mike@example.com', 'Mike Jones', 'https://example.com/mike.jpg', TRUE, FALSE, NULL, NULL),
('alice_walker', 'alice@example.com', 'Alice Walker', 'https://example.com/alice.jpg', TRUE, FALSE, NULL, NULL),
('bob_brown', 'bob@example.com', 'Bob Brown', 'https://example.com/bob.jpg', TRUE, FALSE, NULL, NULL);

-- Insert Dummy Conversations
INSERT INTO conversation (sender_id, receiver_id, message, is_read, is_active, is_deleted, deleted_by, deleted_at) VALUES
(1, 2, 'Hey Jane! How are you?', TRUE, TRUE, FALSE, NULL, NULL),
(2, 1, 'Hey John! I am good, thanks!', TRUE, TRUE, FALSE, NULL, NULL),
(1, 3, 'Mike, did you check the new update?', FALSE, TRUE, FALSE, NULL, NULL),
(3, 2, 'Jane, let’s meet at 3 PM.', FALSE, TRUE, FALSE, NULL, NULL),
(4, 5, 'Bob, can we sync up later?', FALSE, TRUE, FALSE, NULL, NULL),
(5, 4, 'Sure, Alice! Let’s talk at 5 PM.', TRUE, TRUE, FALSE, NULL, NULL);

-- Insert a Soft-Deleted User (For Testing)
INSERT INTO user (username, email, full_name, avatar_url, is_active, is_deleted, deleted_by, deleted_at) VALUES
('deleted_user', 'deleted@example.com', 'Deleted User', 'https://example.com/deleted.jpg', FALSE, TRUE, 1, NOW());

-- Insert a Soft-Deleted Conversation (For Testing)
INSERT INTO conversation (sender_id, receiver_id, message, is_read, is_active, is_deleted, deleted_by, deleted_at) VALUES
(1, 5, 'This message was deleted.', TRUE, FALSE, TRUE, 2, NOW());
