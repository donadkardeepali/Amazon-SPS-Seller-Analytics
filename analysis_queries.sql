/* PROJECT: Amazon Selling Partner Support (SPS) Analytics
PURPOSE: Identify high-latency support categories and segment sellers by performance.
SKILLS: CTEs, Window Functions (AVG OVER), Date Arithmetic, CASE Logic.
*/

WITH TicketMetrics AS (
    SELECT 
        s.seller_name,
        s.seller_type,
        p.category,
        t.issue_type,
        -- Calculating the duration a support ticket remained open
        DATEDIFF('day', t.open_date, t.close_date) AS resolution_days,
        
        -- WINDOW FUNCTION: Calculates the average resolution time for the ENTIRE category
        -- This allows us to compare a specific seller's speed against their peers.
        AVG(DATEDIFF('day', t.open_date, t.close_date)) OVER(PARTITION BY p.category) AS category_avg_days
    FROM Sellers s
    JOIN Products p ON s.seller_id = p.seller_id
    JOIN Support_Tickets t ON s.seller_id = t.seller_id
    WHERE t.is_resolved = TRUE
)

SELECT 
    seller_name,
    category,
    issue_type,
    resolution_days,
    ROUND(category_avg_days, 2) AS category_benchmark,
    
    -- CASE STATEMENT: Business logic to flag sellers needing assistance
    CASE 
        WHEN resolution_days > (category_avg_days + 5) THEN 'High Latency - Action Required'
        WHEN resolution_days < category_avg_days THEN 'Top Performer'
        ELSE 'Standard'
    END AS resolution_efficiency_status,

    -- Identifying if the seller is a "Rising Star" based on your Amazon experience terms
    CASE 
        WHEN resolution_days < category_avg_days AND seller_type = 'Rising Star' THEN 'Priority Growth'
        ELSE 'Maintain'
    END AS strategic_focus
FROM TicketMetrics
ORDER BY resolution_days DESC;
