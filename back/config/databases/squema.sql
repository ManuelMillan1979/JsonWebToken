CREATE DATABASE softjobs;

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(60) NOT NULL,
    rol VARCHAR(25),
    lenguage VARCHAR(20),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

SELECT * FROM usuarios;

CREATE FUNCTION updated_updated_at_usuarios()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ lenguage 'plpgsql';

CREATE FUNCTION updated_usuarios_updated_at
    BEFORE UPDATE
    ON
    usuarios
    FOR EACH ROW
EXECUTE PROCEDURE updated_updated_at_usuarios();
