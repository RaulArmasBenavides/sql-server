use Northwind
 go



select * from Products


select ProductName,SupplierID,UnitPrice from Products 

select  *
from Products  left join Suppliers  
on Products.SupplierID = Suppliers.SupplierID 



select * From Orders 

select o.OrderID as N, c.CompanyName as Customer_name, e.FirstName + e.LastName as Full_name
from Orders o 
left join Employees e on o.EmployeeID = e.EmployeeID
left join Customers c on o.CustomerID = c.CustomerID 


select peru.ProductName from Products peru

select ProductName , CompanyName
from Products p left join Suppliers s  on p.SupplierID = s.SupplierID 
select * from Suppliers
select ProductName,SupplierID,UnitPrice From Products
select p.ProductName,s.CompanyName,p.UnitPrice 
from Products p left join Suppliers s  on p.SupplierID = s.SupplierID

select p.ProductName,s.CompanyName,p.UnitPrice 
from Products p inner join Suppliers s  on p.SupplierID = s.SupplierID
