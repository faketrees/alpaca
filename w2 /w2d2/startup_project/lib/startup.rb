require "employee"

class Startup 

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @funding = funding
        @salaries = salaries
        @name = name
        @employees = []
        @number_of_employees = Hash.new(0)
    end

    def valid_title?(title)
        salaries.has_key?(title) 
    end

    def >(another_startup)
        funding > another_startup.funding ? true : false
    end

    def hire(employee_name, title)
        raise "invalid title" unless valid_title?(title)
        @employees << Employee.new(employee_name, title)
        @number_of_employees[title] += 1
    end

    def size
        @employees.count
    end

    def pay_employee(employee)
      payment = @salaries[employee.title]
      if @funding > payment
        employee.pay(payment)
        @funding -= payment
      else
        raise "not enough funds"
      end
    end

    def payday
      @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total_salary = 0
        @number_of_employees.each do |title, employees|
            total_salary += @salaries[title] * employees
        end
     total_salary / size
    end

    def close 
      @employees = []
      @funding = 0
    end


    def acquire(another_startup)
      @funding += another_startup.funding 
      @employees += another_startup.employees

        another_startup.salaries.each do |title2, salary2|
            @salaries[title2] = another_startup.salaries[title2] if !@salaries.has_key?(title2)
        end
        
      another_startup.close
    end
end


