/*********************************************************/
/*   It is required to use a for loop                    */
/*   when iterating over an employee's array of sales.   */
/*********************************************************/

var Employee = function(attrs) {
  this.firstName = attrs.firstName;
  this.sales = attrs.sales;
};

Employee.prototype.totalSales = function() {
  var employeeTotalSales = 0;
  this.sales.forEach(function(sale) {
    employeeTotalSales += sale;
  });
  return employeeTotalSales;
};

Employee.prototype.averageSales = function() {
  var employeeAverageSales = 0;
  this.sales.forEach(function(sale) {
    employeeAverageSales += sale;
  });
  return employeeAverageSales / this.sales.length;
};
