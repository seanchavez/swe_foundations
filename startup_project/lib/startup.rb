require "employee"

class Startup
  attr_reader :name, :salaries, :employees
  attr_accessor :funding

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries 
    @employees = []
  end

  def valid_title?(string)
    @salaries.has_key?(string)
  end

  def >(other_startup)
    self.funding > other_startup.funding
  end

  def hire(employee_name, title)
    if self.valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "INVALID TITLE"
    end
  end

  def size
    @employees.size
  end

  def pay_employee(employee)
    salary =@salaries[employee.title]
    if self.funding < salary
      raise "NOT ENOUGH FUNDING"
    else
      self.funding -= salary
      employee.pay(salary)
    end
  end

  def payday
    @employees.each {|emp| self.pay_employee(emp)}
  end
end
