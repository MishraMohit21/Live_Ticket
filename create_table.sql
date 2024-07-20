
CREATE TABLE IF NOT EXISTS Users (

    User_Id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash TEXT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

)

CREATE TABLE IF NOT EXISTS Trains (

    train_Id SERIAL PRIMARY KEY,
    train_number VARCHAR(50) UNIQUE NOT NULL,
    train_name VARCHAR(200) NOT NULL,
    train_type VARCHAR(50),
    from_station_code VARCHAR(10),
    from_station_name VARCHAR(100),
    to_station_code VARCHAR(10),
    to_station_name VARCHAR(100),
    departure_time TIME,
    arrival_time TIME,
    duration_hours INT,
    duration_minutes INT,
    distance INT,
    zone VARCHAR(10),
    classes VARCHAR(100),
    first_ac INT,
    second_ac INT, 
    third_ac INT,
    sleeper INT,
    chair_car INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

)

CREATE TABLE IF NOT EXISTS Stations (

    station_Id SERIAL PRIMARY KEY,
    station_state VARCHAR(50) NOT NULL,
    station_code VARCHAR(10) NOT NULL UNIQUE,
    station_name VARCHAR(50) NOT NULL
    station_zone VARCHAR(10) NOT NULL
    station_address VARCHAR(200) NOT NULL UNIQUE

)   

CREATE TABLE IF NOT EXISTS Routes (

    route_Id SERIAL PRIMARY KEY,
    train_id INT REFERENCES Trains(train_Id) ON DELETE CASCADE,
    start_station_id INT REFERENCES Station(station_Id) ON DELETE CASCADE,
    end_station_id INT REFERENCES Station(station_Id) ON DELETE CASCADE,
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    distance_km DECIMAL(10, 2)

)

CREATE TABLE IF NOT EXISTS Ticket (

    ticket_Id SERIAL PRIMARY KEY,
    uesr_Id INT REFERENCES Users(user_Id) ON DELETE CASCADE,
    route_Id INT REFERENCES Routes(route_Id) ON DELETE CASCADE,
    seat_number VARCHAR(10),
    class_type VARCHAR(50),
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) CHECK (status IN ('CNF', 'RAC', 'WL', 'CNCLD')) DEFAULT 'WL',

)


CREATE 