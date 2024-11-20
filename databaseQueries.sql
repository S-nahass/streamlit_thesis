
-- project status report
SELECT 
    p.ProjectID,
    p.ProjectName,
    p.ProjectStartDate,
    p.ProjectEndDate,
    p.ProjectStatus,
    COUNT(t.TaskID) AS TotalTasks,
    COUNT(CASE WHEN t.TaskStatus = 'Completed' THEN 1 END) AS CompletedTasks,
    COUNT(CASE WHEN t.TaskStatus = 'In Progress' THEN 1 END) AS InProgressTasks,
    COUNT(CASE WHEN t.TaskStatus = 'Pending' AND t.TaskDeadline < CURDATE() THEN 1 END) AS OverdueTasks,
    ROUND((COUNT(CASE WHEN t.TaskStatus = 'Completed' THEN 1 END) * 100.0 / COUNT(t.TaskID)), 2) AS PercentageCompleted
FROM 
    Project p
LEFT JOIN 
    Task t ON p.ProjectID = t.TaskProjectID
GROUP BY 
    p.ProjectID, p.ProjectName, p.ProjectStartDate, p.ProjectEndDate, p.ProjectStatus;
    
    -- task completion report
    SELECT 
    t.TaskID,
    t.TaskName,
    p.ProjectName,
    t.TaskStatus,
    t.TaskPriority,
    t.TaskDeadline,
    t.TaskCompletionDate,
    e.EmployeeName AS AssignedTeamMember,
    CASE 
        WHEN t.TaskDeadline < CURDATE() AND t.TaskStatus <> 'Completed' THEN 'Overdue'
        ELSE 'On Track'
    END AS DeadlineStatus
FROM 
    Task t
LEFT JOIN 
    Project p ON t.TaskProjectID = p.ProjectID
LEFT JOIN 
    EmployeeTask et ON t.TaskID = et.TaskID
LEFT JOIN 
    Employee e ON et.EmployeeID = e.EmployeeID;

-- profitability report
SELECT 
    p.ProjectID,
    p.ProjectName,
    COALESCE(SUM(so.SaleOrderRevenue), 0) AS Revenue,
    COALESCE(p.ProjectLaborCost + SUM(po.PurchaseOrderTotal), 0) AS TotalExpenses,
    COALESCE(SUM(so.SaleOrderRevenue), 0) - COALESCE(p.ProjectLaborCost + SUM(po.PurchaseOrderTotal), 0) AS ProfitMargin
FROM 
    Project p
LEFT JOIN 
    SaleOrder so ON p.ProjectSaleOrderID = so.SaleOrderID
LEFT JOIN 
    PurchaseOrder po ON p.ProjectID = po.PurchaseOrderProjectID
GROUP BY 
    p.ProjectID, p.ProjectName, p.ProjectLaborCost;

-- project summary report
SELECT 
    COUNT(*) AS TotalProjects,
    COUNT(CASE WHEN p.ProjectStatus = 'Active' THEN 1 END) AS ActiveProjects,
    COUNT(CASE WHEN p.ProjectStatus = 'Completed' THEN 1 END) AS CompletedProjects,
    ROUND(AVG(DATEDIFF(p.ProjectEndDate, p.ProjectStartDate)), 2) AS AverageProjectDuration,
    ROUND((SUM(CASE WHEN p.ProjectStatus = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS CompletionRate
FROM 
    Project p;

-- Top 5 Projects by Revenue
SELECT 
    p.ProjectID,
    p.ProjectName,
    COALESCE(SUM(so.SaleOrderRevenue), 0) AS Revenue
FROM 
    Project p
LEFT JOIN 
    SaleOrder so ON p.ProjectSaleOrderID = so.SaleOrderID
GROUP BY 
    p.ProjectID, p.ProjectName
ORDER BY 
    Revenue DESC
LIMIT 5;

-- team  performance report
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    e.EmployeeRole,
    COUNT(et.TaskID) AS TotalTasksAssigned,
    COUNT(CASE WHEN t.TaskStatus = 'Completed' THEN 1 END) AS TasksCompleted,
    AVG(et.HoursWorked) AS AvgHoursPerTask
FROM 
    Employee e
LEFT JOIN 
    EmployeeTask et ON e.EmployeeID = et.EmployeeID
LEFT JOIN 
    Task t ON et.TaskID = t.TaskID
GROUP BY 
    e.EmployeeID, e.EmployeeName, e.EmployeeRole;
    
-- workload report
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    COUNT(et.TaskID) AS TotalAssignedTasks,
    COUNT(CASE WHEN t.TaskPriority = 'High' THEN 1 END) AS HighPriorityTasks,
    COUNT(CASE WHEN t.TaskPriority = 'Medium' THEN 1 END) AS MediumPriorityTasks,
    COUNT(CASE WHEN t.TaskPriority = 'Low' THEN 1 END) AS LowPriorityTasks,
    SUM(et.HoursWorked) AS TotalHoursWorked
FROM 
    Employee e
LEFT JOIN 
    EmployeeTask et ON e.EmployeeID = et.EmployeeID
LEFT JOIN 
    Task t ON et.TaskID = t.TaskID
GROUP BY 
    e.EmployeeID, e.EmployeeName;

-- overdue payments
SELECT 
    po.PurchaseOrderID,
    s.SupplierName,
    po.PurchaseOrderTotal,
    p.ProjectName,
    pa.PayableStatus,
    pa.PaymentDate
FROM 
    Payable pa
LEFT JOIN 
    PurchaseOrder po ON pa.PayablePurchaseOrderID = po.PurchaseOrderID
LEFT JOIN 
    Supplier s ON po.PurchaseOrderSupplierID = s.SupplierID
LEFT JOIN 
    Project p ON po.PurchaseOrderProjectID = p.ProjectID
WHERE 
    pa.PayableStatus = 'Pending';

-- overdue receivables
SELECT 
    so.SaleOrderID,
    c.ClientName,
    so.SaleOrderTotal,
    r.ReceivableAmount,
    r.ReceivableStatus,
    r.PaymentDate
FROM 
    Receivable r
LEFT JOIN 
    SaleOrder so ON r.ReceivableSaleOrderID = so.SaleOrderID
LEFT JOIN 
    Client c ON so.SaleOrderClientID = c.ClientID
WHERE 
    r.ReceivableStatus = 'Pending';
