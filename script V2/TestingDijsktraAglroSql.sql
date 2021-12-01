--dijskra testing
--select geom from WalkableAre where name = '[Room name and point type]' ** eg. B30 entry/exit 
--entry is the door point and exit is where the path to the door starts.
-- Declare and set parameters. 
use Door2doorZbc;
DECLARE @start geometry, @end geometry 
SET @start = (select ((select geom from WalkableAreaTesting where id = 2)).STPointN(1));
SET @end = (select ((select geom  from WalkableAreaTesting where name = 'B16 entry')).STEndPoint());

-- Caching of ST function results and for reversibility. 

DECLARE @segments TABLE  ( 
edge geometry, 
start_point geometry, 
end_point geometry, 
[weight] float 
) 
INSERT @segments 
        ( edge, start_point, end_point, [weight]) 
SELECT geom, geom.STStartPoint(), geom.STEndPoint(),  geom.STLength() FROM WalkableAreaTesting 
UNION ALL  
SELECT geom, geom.STEndPoint(), geom.STStartPoint(),  geom.STLength() FROM POI

DECLARE @total_edges INT 

SELECT @total_edges = COUNT(*) FROM WalkableArea; 

-- Meat of the procedure. 
--Find all sensible paths from @start to @end allowed by the graph, using a recursive common table expression. 
WITH cte (path, start_point, end_point, [weight], segments_traversed) AS ( 
SELECT  
    edge AS path, 
    start_point,  
    end_point,  
    [weight] , 
    1 AS segments_traversed 
FROM  
    @segments  
WHERE  
    @start.STEquals(start_point) = 1 UNION ALL  
SELECT  
    c.path.STUnion(s.edge) AS PATH, 
    s.start_point,  
    s.end_point,  
    s.[weight] + c.[weight] AS weight, 
    c.segments_traversed + 1 AS segments_traversed 
FROM cte c  
    INNER JOIN @segments s ON  
        -- next edge must start where this one ended. 
        s.start_point.STEquals(c.end_point) = 1 AND  
        -- terminate paths that hit the endpoint. 
        c.start_point.STEquals(@end) = 0 AND 
        -- if we traversed more than the number of edges there is a better path whice dont loob on to it self     
        -- this acts as a guarantee of termination.   
        c.segments_traversed < @total_edges 
) 
SELECT TOP 1 
    path  
FROM  
    cte c 
WHERE  
    -- Stops at lines endpoint 
    c.end_point.STEquals(@end) = 1 
ORDER BY  
    weight ASC  