create database imgpdfview;
use imgpdfview;
CREATE TABLE files (
    id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique ID for each file
    file_name VARCHAR(255) NOT NULL,       -- Original file name
    file_type VARCHAR(50) NOT NULL,        -- MIME type (e.g., image/png, application/pdf)
    file_data LONGBLOB NOT NULL,           -- Binary data for image or PDF
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Upload time
);

INSERT INTO files (file_name, file_type, file_data)
VALUES
('bkg2.jpg', 'image/jpeg', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bkg2.jpg')),
('document.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/document.pdf'));

select * from files;