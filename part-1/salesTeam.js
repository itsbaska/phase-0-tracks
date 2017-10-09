/**************************************************************/
/*   It is required to use Array.prototype methods            */
/*   when iterating over a sales team's array of employees.   */
/**************************************************************/

var SalesTeam = function(employees) {
  this.employees = employees;
};

SalesTeam.prototype.find = function(employeeToFind) {
  function findEmployee(employee) {
    return employee.firstName === employeeToFind
  }
  return this.employees.find(findEmployee);
};

SalesTeam.prototype.bonusEarners = function() {
  return this.employees.filter(function(employee) {
    return employee.totalSales() > 2500;
  });
};

