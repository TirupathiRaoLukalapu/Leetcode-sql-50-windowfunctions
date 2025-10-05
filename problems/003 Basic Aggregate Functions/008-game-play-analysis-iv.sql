/*
------------------------------------------
Problem: 550. Game Play Analysis IV
------------------------------------------
Question:
Report the fraction of players that logged in again on the day after the day they first logged in.
------------------------------------------
Approach / Explanation:
1. Use a CTE to find the first login date per player.
2. Check if the player has an activity on the next day (first_date + 1 day).
3. Count the number of players who logged in the next day and divide by total players.
4. Round the fraction to 2 decimal places.
------------------------------------------
*/

WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
),
next_day_login AS (
    SELECT f.player_id
    FROM first_login f
    JOIN Activity a
      ON f.player_id = a.player_id
     AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY)
)
SELECT
    ROUND(COUNT(DISTINCT n.player_id) * 1.0 / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM first_login f
LEFT JOIN next_day_login n
  ON f.player_id = n.player_id;
