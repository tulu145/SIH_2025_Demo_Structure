CREATE EXTENSION IF NOT EXISTS cube;
CREATE EXTENSION IF NOT EXISTS earthdistance;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    name VARCHAR(100),
    language VARCHAR(10) DEFAULT 'en',
    location JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS conversations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    message TEXT NOT NULL,
    response TEXT,
    intent VARCHAR(50),
    confidence DECIMAL(3,2),
    platform VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS health_data (
    id SERIAL PRIMARY KEY,
    disease_name VARCHAR(100) NOT NULL,
    symptoms JSONB,
    prevention JSONB,
    treatment JSONB,
    language VARCHAR(10) DEFAULT 'en',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS outbreak_alerts (
    id SERIAL PRIMARY KEY,
    disease_name VARCHAR(100) NOT NULL,
    location JSONB NOT NULL,
    severity VARCHAR(20) DEFAULT 'moderate',
    message JSONB NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS vaccination_schedules (
    id SERIAL PRIMARY KEY,
    vaccine_name VARCHAR(100) NOT NULL,
    age_group VARCHAR(50),
    schedule_info JSONB,
    location_specific JSONB,
    language VARCHAR(10) DEFAULT 'en'
);

CREATE TABLE IF NOT EXISTS alert_deliveries (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    alert_id INTEGER REFERENCES outbreak_alerts(id),
    platform VARCHAR(20),
    status VARCHAR(20),
    delivered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

