SELECT * FROM users;

--* CREATE USERS TABLE
 CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        email VARCHAR(150) UNIQUE NOT NULL,
        password TEXT NOT NULL,
        phone VARCHAR(15) NOT NULL,
       role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'customer'))
);

--! INSERT DATA INTO USERS TABLE 

INSERT INTO users (id, name, email, password, phone, role) VALUES
(1, 'Alice', 'alice@example.com', 'pass123', '1234567890', 'customer'),
(2, 'Bob', 'bob@example.com', 'pass123', '0987654321', 'admin'),
(3, 'Charlie', 'charlie@example.com', 'pass123', '1122334455', 'customer');


    
--* CREATE VEHICLES TABLE 
SELECT * FROM vehicles;
CREATE TABLE IF NOT EXISTS vehicles (
        vehicle_id SERIAL PRIMARY KEY,	
        name VARCHAR(100) NOT NULL,
        type VARCHAR(15) NOT NULL CHECK (type IN('car','bike','truck')),
        model INT NOT NULL,
        registration_number VARCHAR(20)	UNIQUE NOT NULL,
        rental_price INT NOT NULL,
        status VARCHAR(50) NOT NULL CHECK (status IN('available', 'rented', 'maintenance'))
  )

  --! INSERT DATA INTO VEHICELS TABLE

  INSERT INTO vehicles (
  vehicle_id, name, type, model, registration_number, rental_price, status
) VALUES
(1, 'Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');


--* CREATE BOOKINGS TABLE
SELECT * FROM bookings;
CREATE TABLE IF NOT EXISTS bookings(
        booking_id SERIAL PRIMARY KEY,
        user_id INT REFERENCES users(id) ON DELETE CASCADE,
        vehicle_id INT REFERENCES vehicles(vehicle_id) ON DELETE CASCADE,
        start_date DATE NOT NULL,
        end_date DATE NOT NULL,
        status VARCHAR(15) NOT NULL CHECK (status IN('completed','confirmed','pending')) DEFAULT 'pending',
        total_cost INT NOT NULL
)


  --! INSERT DATA INTO BOOKINGS TABLE

INSERT INTO bookings (
  booking_id, user_id, vehicle_id, start_date, end_date, status, total_cost
) VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);

