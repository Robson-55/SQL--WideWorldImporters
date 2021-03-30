SQL-Question3
--Use WideWorldImporters
CREATE PROCEDURE ReportCustomerTurnover 
(@Choice int=1, @Year int=2013)
as
begin

if @Choice=1 BEGIN
select C.CustomerName,
sum( case when format(I.InvoiceDate,'MM') = 01  then (IL.quantity * IL.unitprice) Else 0 END)  AS ENERO,
sum( case when format(I.InvoiceDate,'MM') = 02   then (IL.quantity * IL.unitprice) Else 0 END)  AS FEBRERO,
sum( case when format(I.InvoiceDate,'MM') = 03   then (IL.quantity * IL.unitprice) Else 0 END)  AS MARZO,
sum( case when format(I.InvoiceDate,'MM') = 04   then (IL.quantity * IL.unitprice) Else 0 END)  AS ABRIL,
sum( case when format(I.InvoiceDate,'MM') = 05   then (IL.quantity * IL.unitprice) Else 0 END)  AS MAYO,
sum( case when format(I.InvoiceDate,'MM') = 06   then (IL.quantity * IL.unitprice) Else 0 END)  AS JUNIO,
sum( case when format(I.InvoiceDate,'MM') = 07   then (IL.quantity * IL.unitprice) Else 0 END)  AS JULIO,
sum( case when format(I.InvoiceDate,'MM') = 08   then (IL.quantity * IL.unitprice) Else 0 END)  AS AGOSTO,
sum( case when format(I.InvoiceDate,'MM') = 09   then (IL.quantity * IL.unitprice) Else 0 END)  AS SEPTIEMBRE,
sum( case when format(I.InvoiceDate,'MM') = 10   then (IL.quantity * IL.unitprice) Else 0 END)  AS OCTUBRE,
sum( case when format(I.InvoiceDate,'MM') = 11   then (IL.quantity * IL.unitprice) Else 0 END)  AS NOVIEMBRE,
sum( case when format(I.InvoiceDate,'MM') = 12	 then (IL.quantity * IL.unitprice) Else 0 END)  AS DICIEMBRE

from Sales.Invoices AS I
JOIN 
	SALES.InvoiceLines AS IL
	ON I.InvoiceID=IL.InvoiceID
JOIN
	Sales.Customers as C
	ON C.CustomerID=I.CustomerID
	WHERE year(I.InvoiceDate) = @Year
GROUP BY C.CustomerName 
order by C.CustomerName asc

END

if @Choice=2 BEGIN
select C.CustomerName,
sum( case when (format(I.InvoiceDate,'MM') = 01 or format(I.InvoiceDate,'MM') = 02 or format(I.InvoiceDate,'MM') = 03)
then (IL.quantity * IL.unitprice) Else 0 END)  AS Q1,
sum( case when (format(I.InvoiceDate,'MM') = 04 or format(I.InvoiceDate,'MM') = 05 or format(I.InvoiceDate,'MM') = 06)
then (IL.quantity * IL.unitprice) Else 0 END)  AS Q2,
sum( case when (format(I.InvoiceDate,'MM') = 07 or format(I.InvoiceDate,'MM') = 08 or format(I.InvoiceDate,'MM') = 09)
then (IL.quantity * IL.unitprice) Else 0 END)  AS Q3,
sum( case when (format(I.InvoiceDate,'MM') = 10 or format(I.InvoiceDate,'MM') = 11 or format(I.InvoiceDate,'MM') = 12)
then (IL.quantity * IL.unitprice) Else 0 END)  AS Q4

from Sales.Invoices AS I
JOIN 
	SALES.InvoiceLines AS IL
	ON I.InvoiceID=IL.InvoiceID
JOIN
	Sales.Customers as C
	ON C.CustomerID=I.CustomerID
	WHERE year(I.InvoiceDate) = @Year
GROUP BY C.CustomerName 
order by C.CustomerName asc

END


if @choice=3 BEGIN
select C.CustomerName,
sum( case when year(I.InvoiceDate) = 2013  then (IL.quantity * IL.unitprice) Else 0 END)  AS '2013',
sum( case when year(I.InvoiceDate) = 2014  then (IL.quantity * IL.unitprice) Else 0 END)  AS '2014',
sum( case when year(I.InvoiceDate) = 2015  then (IL.quantity * IL.unitprice) Else 0 END)  AS '2015',
sum( case when year(I.InvoiceDate) = 2016  then (IL.quantity * IL.unitprice) Else 0 END)  AS '2016'

from Sales.Invoices AS I
JOIN 
	SALES.InvoiceLines AS IL
	ON I.InvoiceID=IL.InvoiceID
JOIN
	Sales.Customers as C
	ON C.CustomerID=I.CustomerID
	
GROUP BY C.CustomerName 
order by C.CustomerName asc

END
end
































