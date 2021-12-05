USE ShopDB;

Select customers.FName As Customer, employees.FName as Employee, orderdetails.TotalPrice
from orders
Join customers on customers.CustomerNo = orders.CustomerNo
Join employees on employees.EmployeeID = orders.EmployeeID
Join orderdetails on orderdetails.OrderID = orders.OrderID
where orderdetails.TotalPrice > 1000;
