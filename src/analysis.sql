-- 1. Calculate the Overall No-Show Rate
-- Use a CASE statement to turn 'Yes' into 1 and 'No' into 0 so we can do math on them.
SELECT 
    COUNT(*) as Total_Appointments,
    SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) as Total_No_Shows,
    ROUND(
        (SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
    2) as No_Show_Percentage
FROM appointments;

-- 2. Compare No-Show Rates: SMS vs. No SMS
SELECT 
    SMS_received,
    COUNT(*) as Total_Appointments,
    SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) as Missed_Appointments,
    ROUND(
        (SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
    2) as No_Show_Rate
FROM appointments
GROUP BY SMS_received;

-- 3. No-Show Rate by Age Group
SELECT 
    CASE 
        WHEN Age < 18 THEN '0-17 (Youth)'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35 (Young Adult)'
        WHEN Age BETWEEN 36 AND 60 THEN '36-60 (Adult)'
        ELSE '60+ (Senior)' 
    END as Age_Group,
    COUNT(*) as Total_Appointments,
    ROUND(
        (SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
    2) as No_Show_Rate
FROM appointments
GROUP BY Age_Group
ORDER BY No_Show_Rate DESC; -- Sort by the "worst" offenders