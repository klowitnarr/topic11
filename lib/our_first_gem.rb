# frozen_string_literal: true

require_relative "our_first_gem/version"

module OurFirstGem
  class Error < StandardError; end
  
  # ПЛОЩАДИ:
  
  # Площадь Круга
  def self.circle(radius)
    if radius.positive?
      s = Math::PI * radius**2
      puts "Площадь круга с радиусом #{radius} равна #{s.round(2)}"
      return s.round(2)  
    else
      puts "Ошибка: радиус должен быть положительным числом"
      return nil
    end
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
    return nil
  end

  # Площадь Прямоугольник (или квадрат, если указана одна сторона)
  def self.rectangle(a, b = nil)
    b ||= a
    if a.to_f <= 0 || b.to_f <= 0
      puts "Ошибка: стороны должны быть положительными числами"
      return
    end
    area = a.to_f * b.to_f
    formatted_area = area == area.to_i ? area.to_i : area.round(2)
    puts "Площадь прямоугольника #{a} × #{b} = #{formatted_area}"
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
  end

  # Площадь Треугольника (по трём сторонам или двум сторонам и углу)
  def self.triangle(a, b, c = nil, angle = nil)
    if !c.nil? && angle.nil?
      # Формула Герона
      if valid_triangle?(a, b, c)
        p = (a + b + c) / 2.0
        area = Math.sqrt(p * (p - a) * (p - b) * (p - c))
        puts "Площадь треугольника по трём сторонам равна #{area.round(2)}"
      else
        puts "Ошибка: такого треугольника не существует"
      end
    elsif c.nil? && angle.nil?
      puts "Ошибка: для расчета по двум сторонам и углу укажите угол"
    elsif c.nil? && !angle.nil?
      # По двум сторонам и углу между ними
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

  # --- Вспомогательные методы для треугольника ---
  def self.valid_triangle?(a, b, c)
    a > 0 && b > 0 && c > 0 &&
      a + b > c &&
      a + c > b &&
      b + c > a
  end

  def self.valid_sides_and_angle?(a, b, angle)
    a > 0 && b > 0 && angle > 0 && angle < 180
  end

  #ОБЪЁМЫ:

  # Объём шара
  def self.sphere_volume(radius)
    if radius.positive?
      volume = (4.0 / 3) * Math::PI * radius**3
      puts "Объём шара с радиусом #{radius} равен #{volume.round(2)}"
      volume.round(2)
    else
      puts "Ошибка: радиус должен быть положительным числом"
      nil
    end
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
    nil
  end

  # Объём параллелепипеда (или куба, если все стороны равны)
  def self.cuboid_volume(a, b = nil, c = nil)
    b ||= a
    c ||= a
    if a.to_f > 0 && b.to_f > 0 && c.to_f > 0
      volume = a * b * c
      puts "Объём параллелепипеда #{a} × #{b} × #{c} = #{volume.round(2)}"
      volume.round(2)
    else
      puts "Ошибка: все стороны должны быть положительными числами"
      nil
    end
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
    nil
  end

  # Объём пирамиды (основание - прямоугольник)
  def self.pyramid_volume(base_area, height)
    if base_area.to_f > 0 && height.to_f > 0
      volume = (base_area * height) / 3.0
      puts "Объём пирамиды с площадью основания #{base_area} и высотой #{height} = #{volume.round(2)}"
      volume.round(2)
    else
      puts "Ошибка: площадь основания и высота должны быть положительными числами"
      nil
    end
  rescue ArgumentError, TypeError
    puts "Ошибка: неверный тип аргументов"
    nil
  end


  # --- Тестовые методы с пары
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
