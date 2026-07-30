# Write your MySQL query statement below
WITH UserStats AS (
    SELECT 
        user_id,
        COUNT(prompt) AS prompt_count,
        AVG(tokens * 1.0) AS avg_tokens
    FROM prompts
    GROUP BY user_id
    HAVING COUNT(prompt) >= 3
)
SELECT 
    p.user_id,
    us.prompt_count,
    ROUND(us.avg_tokens, 2) AS avg_tokens
FROM prompts p
JOIN UserStats us 
    ON p.user_id = us.user_id
WHERE p.tokens > us.avg_tokens
GROUP BY p.user_id, us.prompt_count, us.avg_tokens
ORDER BY avg_tokens DESC, p.user_id ASC;