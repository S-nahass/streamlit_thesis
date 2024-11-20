-- Insert data into Client table
INSERT INTO Client (ClientID, ClientName, ClientContactInfo)
VALUES
(1, 'Eng Mohamed Emara', '01012345678'),
(2, 'Mrs. Sarah Abdullah', '01123456789'),
(3, 'Mr. Ahmed Salama', '01234567890'),
(4, 'Dr. Khaled Ahmed', '01345678901'),
(5, 'Mrs. Fatma Ezzat', '01456789012');

-- Insert data into Team table
INSERT INTO Team (TeamID, TeamName)
VALUES
(1, 'Design Team'),
(2, 'Renovation Team'),
(3, 'Delivery Team'),
(4, 'Carpentry Team'),
(5, 'Painting Team');

-- Insert data into Employee table
INSERT INTO Employee (EmployeeID, EmployeeName, EmployeeRole, EmployeeTeamID)
VALUES
(1, 'Ahmed Hassan', 'Architect', 1),
(2, 'Sarah Kamal', 'Interior Designer', 1),
(3, 'Mahmoud Fathy', 'Renovation Lead', 2),
(4, 'Nour Ghaly', 'Carpenter', 4),
(5, 'Yasmine Ibrahim', 'Painter', 5);

-- Insert data into SaleOrder table
INSERT INTO SaleOrder (SaleOrderID, SaleOrderClientID, SaleOrderDate, SaleOrderTotal, SaleOrderRevenue)
VALUES
(1, 1, '2024-01-15', 2183700.00, 2000000.00),
(2, 2, '2024-02-10', 876450.00, 850000.00),
(3, 3, '2024-03-05', 1348050.00, 1300000.00),
(4, 4, '2024-04-01', 320175.00, 300000.00),
(5, 5, '2024-05-12', 1459725.00, 1400000.00);

-- Insert data into Project table
INSERT INTO Project (ProjectID, ProjectSaleOrderID, ProjectTeamID, ProjectName, ProjectStartDate, ProjectEndDate, ProjectStatus, ProjectLaborCost)
VALUES
(1, 1, 1, 'Full Home Renovation', '2024-01-16', '2024-02-15', 'Completed', 300000.00),
(2, 2, 2, 'Living Room Renovation', '2024-02-11', '2024-03-01', 'Completed', 200000.00),
(3, 3, 3, 'Bedroom Renovation', '2024-03-06', '2024-04-05', 'Completed', 350000.00),
(4, 4, 4, 'Dining Space Renovation', '2024-04-02', '2024-05-01', 'Active', 250000.00),
(5, 5, 5, 'Office Space Renovation', '2024-05-13', '2024-06-13', 'Active', 150000.00);

-- Insert data into Task table
INSERT INTO Task (TaskID, TaskProjectID, TaskName, TaskStatus, TaskPriority, TaskDeadline, TaskCompletionDate)
VALUES
(1, 1, 'Initial Consultation', 'Completed', 'High', '2024-01-20', '2024-01-19'),
(2, 1, 'Design Approval', 'Completed', 'High', '2024-01-25', '2024-01-23'),
(3, 2, 'Furniture Installation', 'Completed', 'Medium', '2024-02-28', '2024-02-27'),
(4, 3, 'Painting Walls', 'In Progress', 'Medium', '2024-03-30', NULL),
(5, 4, 'Floor Polishing', 'Pending', 'Low', '2024-04-25', NULL);

-- Insert data into EmployeeTask table
INSERT INTO EmployeeTask (EmployeeTaskID, TaskID, EmployeeID, HoursWorked)
VALUES
(1, 1, 1, 4.00),
(2, 2, 2, 6.00),
(3, 3, 3, 8.00),
(4, 4, 4, 7.50),
(5, 5, 5, NULL);

-- Insert data into Supplier table
INSERT INTO Supplier (SupplierID, SupplierName, SupplierContactInfo)
VALUES
(1, 'Supplier A', '01012345678'),
(2, 'Supplier B', '01123456789'),
(3, 'Supplier C', '01234567890'),
(4, 'Supplier D', '01345678901'),
(5, 'Supplier E', '01456789012');

-- Insert data into PurchaseOrder table
INSERT INTO PurchaseOrder (PurchaseOrderID, PurchaseOrderSupplierID, PurchaseOrderProjectID, PurchaseOrderDate, PurchaseOrderTotal)
VALUES
(1, 1, 1, '2024-01-17', 500000.00),
(2, 2, 2, '2024-02-15', 300000.00),
(3, 3, 3, '2024-03-10', 450000.00),
(4, 4, 4, '2024-04-15', 200000.00),
(5, 5, 5, '2024-05-15', 250000.00);

-- Insert data into Payable table
INSERT INTO Payable (PayableID, PayablePurchaseOrderID, PayableAmount, PayableStatus, PaymentDate)
VALUES
(1, 1, 500000.00, 'Paid', '2024-01-30'),
(2, 2, 300000.00, 'Paid', '2024-02-20'),
(3, 3, 450000.00, 'Pending', NULL),
(4, 4, 200000.00, 'Paid', '2024-04-20'),
(5, 5, 250000.00, 'Pending', NULL);

-- Insert data into Receivable table
INSERT INTO Receivable (ReceivableID, ReceivableSaleOrderID, ReceivableAmount, ReceivableStatus, PaymentDate)
VALUES
(1, 1, 2000000.00, 'Paid', '2024-01-25'),
(2, 2, 850000.00, 'Paid', '2024-02-15'),
(3, 3, 1300000.00, 'Pending', NULL),
(4, 4, 300000.00, 'Paid', '2024-04-10'),
(5, 5, 1400000.00, 'Pending', NULL);
