-- Create the database
DROP DATABASE IF EXISTS ProjectManagement;
CREATE DATABASE ProjectManagement;
USE ProjectManagement;

-- Create Client table
CREATE TABLE Client (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    ClientName VARCHAR(100),
    ClientContactInfo VARCHAR(255)
);

-- Create Team table
CREATE TABLE Team (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(100)
);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    EmployeeRole VARCHAR(50),
    EmployeeTeamID INT,
    FOREIGN KEY (EmployeeTeamID) REFERENCES Team(TeamID)
);

-- Create SaleOrder table
CREATE TABLE SaleOrder (
    SaleOrderID INT PRIMARY KEY AUTO_INCREMENT,
    SaleOrderClientID INT,
    SaleOrderDate DATE,
    SaleOrderTotal DECIMAL(10, 2),
    SaleOrderRevenue DECIMAL(10, 2) DEFAULT 0.00, -- Revenue for profitability report
    FOREIGN KEY (SaleOrderClientID) REFERENCES Client(ClientID)
);

-- Create Project table
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectSaleOrderID INT,
    ProjectTeamID INT,
    ProjectName VARCHAR(100),
    ProjectStartDate DATE,
    ProjectEndDate DATE,
    ProjectStatus VARCHAR(50) DEFAULT 'Active', -- Added to track project status
    ProjectLaborCost DECIMAL(10, 2) DEFAULT 0.00, -- Added to track labor costs
    FOREIGN KEY (ProjectSaleOrderID) REFERENCES SaleOrder(SaleOrderID),
    FOREIGN KEY (ProjectTeamID) REFERENCES Team(TeamID)
);

-- Create Task table
CREATE TABLE Task (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,
    TaskProjectID INT,
    TaskName VARCHAR(100),
    TaskStatus VARCHAR(50) DEFAULT 'Pending', -- Status: Pending, In Progress, Completed
    TaskPriority VARCHAR(50) DEFAULT 'Medium', -- Priority: High, Medium, Low
    TaskDeadline DATE, -- Deadline for task
    TaskCompletionDate DATE, -- Completion date
    FOREIGN KEY (TaskProjectID) REFERENCES Project(ProjectID)
);

-- Create EmployeeTask junction table
CREATE TABLE EmployeeTask (
    EmployeeTaskID INT PRIMARY KEY AUTO_INCREMENT,
    TaskID INT,
    EmployeeID INT,
    HoursWorked DECIMAL(5, 2), -- Added to track employee hours for workload and performance
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Create Supplier table
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    SupplierContactInfo VARCHAR(255)
);

-- Create PurchaseOrder table
CREATE TABLE PurchaseOrder (
    PurchaseOrderID INT PRIMARY KEY AUTO_INCREMENT,
    PurchaseOrderSupplierID INT,
    PurchaseOrderProjectID INT,
    PurchaseOrderDate DATE,
    PurchaseOrderTotal DECIMAL(10, 2),
    FOREIGN KEY (PurchaseOrderSupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (PurchaseOrderProjectID) REFERENCES Project(ProjectID)
);

-- Create Payable table
CREATE TABLE Payable (
    PayableID INT PRIMARY KEY AUTO_INCREMENT,
    PayablePurchaseOrderID INT,
    PayableAmount DECIMAL(10, 2),
    PayableStatus VARCHAR(50),
    PaymentDate DATE, -- Added to track payment date
    FOREIGN KEY (PayablePurchaseOrderID) REFERENCES PurchaseOrder(PurchaseOrderID)
);

-- Create Receivable table
CREATE TABLE Receivable (
    ReceivableID INT PRIMARY KEY AUTO_INCREMENT,
    ReceivableSaleOrderID INT,
    ReceivableAmount DECIMAL(10, 2),
    ReceivableStatus VARCHAR(50),
    PaymentDate DATE, -- Added to track payment date
    FOREIGN KEY (ReceivableSaleOrderID) REFERENCES SaleOrder(SaleOrderID)
);
