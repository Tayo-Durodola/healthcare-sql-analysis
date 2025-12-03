-- Drop the table if it already exists (good for re-running scripts)
DROP TABLE IF EXISTS appointments;

-- Create the table structure to match the CSV exactly
CREATE TABLE appointments (
    PatientId INTEGER,
    AppointmentID INTEGER,
    Gender TEXT,
    ScheduledDay TEXT,
    AppointmentDay TEXT,
    Age INTEGER,
    Neighbourhood TEXT,
    Scholarship INTEGER,
    Hipertension INTEGER,  -- Note: The dataset misspells "Hypertension"
    Diabetes INTEGER,
    Alcoholism INTEGER,
    Handcap INTEGER,       -- Note: The dataset misspells "Handicap"
    SMS_received INTEGER,
    No_show TEXT           -- This column is "No-show" in CSV, mapped to No_show
);