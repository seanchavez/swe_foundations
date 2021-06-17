require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

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
    @funding > other_startup.funding
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
    if @funding < salary
      raise "NOT ENOUGH FUNDING"
    else
      @funding -= salary
      employee.pay(salary)
    end
  end

  def payday
    @employees.each {|emp| self.pay_employee(emp)}
  end

  def average_salary
    @employees.reduce(0) do |sum, emp| 
      sum + salaries[emp.title] 
    end / employees.length.to_f
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    @employees += other_startup.employees
    @salaries = other_startup.salaries.merge(@salaries)
    other_startup.close
  end
end