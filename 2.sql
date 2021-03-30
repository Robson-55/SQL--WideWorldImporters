SQL-Question2
USE WideWorldImporters
UPDATE Sales.InvoiceLines 
SET Sales.InvoiceLines.UnitPrice=Sales.InvoiceLines.UnitPrice+20
where Sales.InvoiceLines.InvoiceLineID=
										(select min(Sales.InvoiceLines.InvoiceLineID) from Sales.InvoiceLines where Sales.InvoiceLines.InvoiceID=
											(select min(I.InvoiceID)
												from Sales.Invoices as I
												where I.customerID=1060))