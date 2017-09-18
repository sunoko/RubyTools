
# ビジネスロジックを記述する名前空間
# validation

require 'active_interaction'
# run
# run
# result
# valid
# errors
# param hash
class Square < ActiveInteraction::Base
  float :x

  def execute
    x**2
  end
end
outcome_1 = Square.run(x: 'two point one')
outcome_1.errors.messages
outcome_2 = Square.run(x: 5)
outcome_2.valid?
outcome_2.result

class SayHello < ActiveInteraction::Base
  string :name
  validates :name,
    presence: true

  def execute
    "Hello, #{name}!"
  end
end
SayHello.run!(name: "chinone")
SayHello.run!(name: "")
SayHello.run!(name: 33)

class ArrayInteraction < ActiveInteraction::Base
  array :toppings
  def execute
    toppings.size
  end
end
ArrayInteraction.run!(toppings: 'everything')
ArrayInteraction.run!(toppings: [:cheese, 'pepperoni', 'ichogo'])