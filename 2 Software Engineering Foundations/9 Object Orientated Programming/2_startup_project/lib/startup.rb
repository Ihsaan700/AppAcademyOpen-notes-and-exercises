require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title) ? true : false
  end

  def >(other_startup)
    funding > other_startup.funding ? true : false
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise 'Title is invalid'
    end
  end

  def size
    @employees.count
  end

  def pay_employee(employee)
    money_owed = @salaries[employee.title]
    if @funding >= money_owed
      employee.pay(money_owed)
      @funding -= money_owed
    else
      raise 'Not enough funds'
    end
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    sum = 0
    @employees.each do |employee|
      sum += @salaries[employee.title]
    end

    sum / (@employees.length * 1.0)
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    # add funding
    @funding += startup.funding

    # merging salaries
    startup.salaries.each do |title, amount|
      @salaries[title] = amount unless @salaries.has_key?(title)
    end

    # add eemplyees
    @employees += startup.employees

    # close startup
    startup.close
  end
end
