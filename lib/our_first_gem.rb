# frozen_string_literal: true

require_relative "our_first_gem/version"

module OurFirstGem
  class Error < StandardError; end
  
  # == Методы

  # = Основные методы:
  # 1. #circle - площадь круга
  # 2. #rectangle - площадь прямоугольника (или квадрата, если указана одна сторона)
  # 3. #triangle - площадь треугольника (по трём сторонам либо двум сторонам и углу)
  # 4. #sphere_volume - объём шара
  # 5. #cuboid_volume - объём параллелепипеда (или куба, если указана одна сторона)
  # 6. #pyramid_volume - объём пирамиды (основание - любой треугольник, прямоугольник, либо правильный многоугольник)

  # = Вспомогательные методы:
  # 3.1. #valid_triangle? - проверка допустимости значений длин трёх сторон
  # 3.2. #valid_sides_and_angle? - проверка допустимости значений градуса угла и длин двух сторон


  # ПЛОЩАДИ:

  # Площадь круга
  def self.circle(radius)
    # @param radius [Double] радиус круга
    # @return [Double] площадь круга
    if radius.positive?
      s = Math::PI * radius**2
      puts "Площадь круга с радиусом #{radius} равна #{s.round(2)}"
      return s.round(2)  
    else
      puts "Ошибка: радиус должен быть положительным числом"
      return nil
    end
  rescue ArgumentError, TypeError, NoMethodError
    puts "Ошибка: неверный тип аргументов"
    return nil
  end
 

  # Площадь прямоугольника
  def self.rectangle(a, b = nil)
    # @param a [Double] длина прямоугольника
    # @param b [Double] ширина прямоугольника
    # @return [Double] площадь прямоугольника
    b ||= a
    if a.to_f <= 0 || b.to_f <= 0
      puts "Ошибка: стороны должны быть положительными числами"
      return nil
    end
    
    area = a.to_f * b.to_f
    formatted_area = area == area.to_i ? area.to_i : area.round(2)
    puts "Площадь прямоугольника #{a} × #{b} = #{formatted_area}"
    formatted_area  # добавлен явный возврат
  rescue ArgumentError, TypeError, NoMethodError
    puts "Ошибка: неверный тип аргументов"
    nil
  end

  # Площадь треугольника
  def self.triangle(a, b, c = nil, angle: nil)
    # @param a [Double] 
    # @param b [Double] 
    # @param c [Double] 
    # @param angle [Double] угол между a,b в градусах
    # @return [Double] площадь треугольника
    begin

    a_num = a.to_f
    b_num = b.to_f
    if !c.nil? && angle.nil?
      # Формула Герона
      c_num = c.to_f
      if a_num <= 0 || b_num <= 0 || c_num <= 0
        puts "Ошибка: стороны должны быть положительными числами"
        return nil
      end

      if valid_triangle?(a, b, c)
        p = (a_num + b_num + c_num) / 2.0
        area = Math.sqrt(p * (p - a_num) * (p - b_num) * (p - c_num))
        puts "Площадь треугольника по трём сторонам равна #{area.round(2)}"
        return area

      else
        puts "Ошибка: такого треугольника не существует"
        return nil
      end

    elsif !angle.nil?
      # По двум сторонам и углу между ними
      angle_num = angle.to_f
      if valid_sides_and_angle?(a_num, b_num, angle_num)
        angle_radians = angle_num * Math::PI / 180.0
        area = 0.5 * a_num * b_num * Math.sin(angle_radians)

        puts "Площадь треугольника по двум сторонам и углу равна #{area.round(2)}"
        return area
      else
        puts "Ошибка: недопустимые параметры треугольника"
      end
    else
      puts "Ошибка: неверный набор параметров"
    end

  rescue ArgumentError, TypeError, NoMethodError
    puts "Ошибка: неверный тип аргументов"
    nil
  end
  end


  # --- Вспомогательные методы для треугольника ---
  def self.valid_triangle?(a, b, c)
    # @param a [Double] 
    # @param b [Double] 
    # @param c [Double] 
    # @return [Boolean] 
    a > 0 && b > 0 && c > 0 &&
      a + b > c &&
      a + c > b &&
      b + c > a
  end

  def self.valid_sides_and_angle?(a, b, angle)
    # @param a [Double] 
    # @param b [Double]  
    # @param angle [Double] угол между a,b в градусах
    # @return [Boolean] 
    a > 0 && b > 0 && angle > 0 && angle < 180
  end


  #ОБЪЁМЫ:

  # Объём шара
  def self.sphere_volume(radius)
    # @param radius [Double] радиус шара
    # @return [Double] объём шара
    if radius.positive?
      volume = (4.0 / 3) * Math::PI * radius**3
      puts "Объём шара с радиусом #{radius} равен #{volume.round(2)}"
      volume.round(2)
    else
      puts "Ошибка: радиус должен быть положительным числом"
      nil
    end
  rescue ArgumentError, TypeError, NoMethodError
    puts "Ошибка: неверный тип аргументов"
    nil
  end


  # Объём параллелепипеда (или куба, если все стороны равны)
  def self.cuboid_volume(a, b = nil, c = nil)
    # @param a [Double] длина параллелепипеда
    # @param b [Double] ширина параллелепипеда
    # @param c [Double] высота параллелепипеда
    # @return [Double] объём параллелепипеда
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
  rescue ArgumentError, TypeError, NoMethodError
    puts "Ошибка: неверный тип аргументов"
    nil
  end


  # Объём пирамиды
  def self.pyramid_volume(height, n, a, b = nil, c = nil)
    # @param height [Double] высота пирамиды
    # @param n [Integer] кол-во сторон основания
    # @param a [Double] # сторона основания
    # @param b [Double] # 2-я сторона основания(если треугольник)
    # @param c [Double] # 3-я сторона основания (если треугольник)
    # @return [Double] объём пирамиды

    if n < 3
      puts "Ошибка: основание пирамиды должно иметь не менее 3 сторон"
      return nil
    end

    if b != nil && c != nil
      base_area = triangle(a, b, c)
    elsif (b != nil && c == nil) || (c != nil && b == nil) 
      base_area = rectangle(a,b)
    else
      base_area = n*a**2/(4*Math.tan(Math::PI/n))
    end

    if base_area.to_f > 0 && height.to_f > 0
      volume = (base_area * height) / 3.0
      puts "Объём пирамиды с площадью основания #{base_area} и высотой #{height} = #{volume.round(2)}"
      volume.round(2)
    else
      puts "Ошибка: аргументы должны быть положительными числами"
      nil
    end
  rescue ArgumentError, TypeError, NoMethodError
    puts "Ошибка: неверный тип аргументов"
    nil
  end

end

