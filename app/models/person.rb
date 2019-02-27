class Person < ApplicationRecord
  # Associations
  # Validations
  validates :age, numericality: {
    less_than_or_equal_to: 150,
    greater_than_or_equal_to: 18
  }

  validates :alive, inclusion {
    in: %w(true, false),
    message: "%{value} is invalid"
  }

  validates :gender, :name, :age, :alive, precense: true 

  validates :hair_color, :eye_color, allow_blank: true

  validates :name, uniqueness: true

  # Methods

  #class method 
    
  def self.order_age
    order(age: :desc)
  end


  #instance method
    before_create : set_alive

    def set_alive
      self.alive = true
    end
end
