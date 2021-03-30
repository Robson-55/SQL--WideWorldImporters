SQL-Question1
USE WideWorldImporters
DROP TABLE IF EXISTS Newtable1
SELECT 
O.CustomerID,
C.CustomerName,
COUNT (DISTINCT O.OrderID) as TotalNBOrders,
COUNT( distinct I.InvoiceID) as TotalNbInvoices,
SUM(CT.AmountExcludingTax) AS TotalValueOrder

INTO NEWTABLE1

FROM Sales.Orders as O
JOIN Sales.Customers as C
	ON O.CustomerID=C.CustomerID
JOIN Sales.Invoices as I
	ON O.OrderID=I.OrderID
JOIN Sales.CustomerTransactions as CT
	ON I.InvoiceID=CT.InvoiceID

GROUP BY O.CustomerID, C.CustomerName

SELECT 
NEWTABLE1.CustomerID,
CustomerName,
TotalNBOrders,
TotalNbInvoices,
TotalValueOrder,
TotalInvoiceValue,
abs(TotalValueOrder-TotalInvoiceValue) as AbsoluteValueDifference
FROM NEWTABLE1
JOIN (select 
		I.CustomerID,
		sum(Quantity*unitPrice) AS TotalInvoiceValue 
		from Sales.InvoiceLines as IL 
		JOIN Sales.Invoices as I
		ON IL.InvoiceID=I.InvoiceID
		group by I.CustomerID) as SUBQUERY
ON SUBQUERY.CustomerID=NEWTABLE1.CustomerID

ORDER BY AbsoluteValueDifference DESC, TotalNBOrders ASC;







