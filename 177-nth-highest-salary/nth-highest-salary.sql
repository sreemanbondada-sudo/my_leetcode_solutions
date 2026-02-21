CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    SELECT salary into result
    from (
        SELECT salary, ROWNUM AS rn
        FROM (
            select distinct  salary
            FROM Employee
            ORDER BY salary DESC
        )
    )
    where rn = N;

    RETURN result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        return null;

END;