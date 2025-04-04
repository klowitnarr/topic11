# frozen_string_literal: true

require_relative "our_first_gem/version"

module OurFirstGem
  # extend self
  class Error < StandardError; end
  # Your code goes here...

  # круг, прямоугольник, треугольник

  # круг
  def  circle(radius)
    if radius.positive?
      s = Math::PI * radius**2
      puts "Площадь круга с радиусом #{radius} равна #{s.round(2)}"
    else
      puts "Ошибка: радиус должен быть положительным числом"
    end
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
  end

  # прямоугольник
  def (a, b = nil)
    # Если передан один аргумент (квадрат)
    b ||= a
    if a.to_f <= 0 || b.to_f <= 0
      return puts "Ошибка: стороны должны быть положительными числами"
    end
    area = a.to_f * b.to_f
    # ?
    formatted_area = area == area.to_i ? area.to_i : area.round(2)

    puts "Площадь прямоугольника #{a} × #{b} = #{formatted_area}"
  # ?
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
  end

  # треугольник
  def triangle(a, b, c = nil, angle = nil)
    if !c.nil? && angle.nil?
      # Расчет по трем сторонам (формула Герона)
      if valid_triangle?(a, b, c)
        p = (a + b + c) / 2.0
        area = Math.sqrt(p * (p - a) * (p - b) * (p - c))
        puts "Площадь треугольника по трем сторонам равна #{area.round(2)}"
      else
        puts "Ошибка: такого треугольника не существует"
      end
    elsif c.nil? && angle.nil?
      puts "Ошибка: для расчета по двум сторонам и углу укажите угол"
    elsif c.nil? && !angle.nil?
      # Расчет по двум сторонам и углу между ними
      if valid_sides_and_angle?(a, b, angle)
        angle_radians = angle * Math::PI / 180.0
        area = 0.5 * a * b * Math.sin(angle_radians)
        puts "Площадь треугольника по двум сторонам и углу равна #{area.round(2)}"
      else
        puts "Ошибка: недопустимые параметры треугольника"
      end
    else
      puts "Ошибка: неверный набор параметров"
    end
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
  end

  # --- вспопомогательные (для треугольника) ---
  def valid_triangle?(a, b, c)
    a > 0 && b > 0 && c > 0 &&
      a + b > c &&
      a + c > b &&
      b + c > a
  end

  def valid_sides_and_angle?(a, b, angle)
    a > 0 && b > 0 && angle > 0 && angle < 180
  end

  # --------------------------------------------------

  # написали на паре код для примера
  # привет на разных языках
  def self.eng
    "Hello"
  end

  def self.rus
    "Привет"
  end

  def self.fr
    "Salut"
  end

  def self.it
    "Ciao"
  end
end

# после того как все спеки пропишем
# rake build
# rake install

# может ругаться на рубокоп
# тогда надо его отдельно установить

# ! ! !
# хотим запустить:
# rake install
# rake build
# в irb :
# require 'our_first_gem'
# OurFirstGem.<method>
