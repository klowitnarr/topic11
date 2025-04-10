# frozen_string_literal: true

require "test_helper"
require_relative '../lib/our_first_gem'
class TestOurFirstGem < Minitest::Test
  def test_circle_area_circle_common
    assert_equal OurFirstGem.circle(1),Math::PI.round(2)
  end

  def test_circle_area_zero
    assert_nil OurFirstGem.circle(0)
  end

  def test_circle_area_circle_negative
    assert_nil OurFirstGem.circle(-1)
  end

  def test_circle_area_circle_argument_type # ошибка будет другая NoMethodError, отлови и выдай nil
    assert_nil OurFirstGem.circle(nil)
    assert_output(/Ошибка: неверный тип аргументов/) do
      OurFirstGem.circle("string")
    end
  end

  def test_rectangle_common
    assert_equal  OurFirstGem.rectangle(2,3),6
  end

  def test_square_common
    assert_equal OurFirstGem.rectangle(2),4
  end

  def test_rectangle_negative
    assert_nil OurFirstGem.rectangle(-2)
  end

  def test_rectangle_zero
    assert_nil OurFirstGem.rectangle(0)
  end

  def test_rectangel_argument_type
    assert_nil OurFirstGem.rectangle("lgsjk",4)
    assert_nil OurFirstGem.rectangle(false)
  end

  def test_triangle_common
    assert_equal OurFirstGem.triangle(3, 4, 5), 6
  end

  def test_triangle_incorrect_sides
    assert_nil OurFirstGem.triangle(2,2,4)
  end

  def test_triangle_angle_and_two_sides
    assert_equal OurFirstGem.triangle(3,4,angle: 30).round(2),3
  end

  def test_triangle_negative
    assert_nil OurFirstGem.triangle(-1,2,3)
  end

  def test_triangle_zero_side
    assert_nil OurFirstGem.triangle(0, 0, 0)
  end

  def test_triangle_angle_zero_sides
    assert_nil OurFirstGem.triangle(0, 0, angle:1 )
  end

  def test_triangle_zero_angle
    assert_nil OurFirstGem.triangle(2,1,0),nil
  end

  def test_triangle_incorrect_args_type
    assert_nil OurFirstGem.triangle("lgsjk",4,4)
    assert_nil OurFirstGem.triangle(false,false,false)
  end

  def test_sphere_common
    assert_equal OurFirstGem.sphere_volume(1.0),(4/3.0*Math::PI).round(2)
  end

  def test_sphere_zero
    assert_nil OurFirstGem.sphere_volume(0.0)
  end

  def test_sphere_negative
    assert_nil OurFirstGem.sphere_volume(-2)
  end

  def test_sphere_arg_type_err
    assert_nil OurFirstGem.sphere_volume("lgsjk")
    assert_nil OurFirstGem.sphere_volume(false)
  end

  def test_cuboid_volume_common
    assert_equal OurFirstGem.cuboid_volume(2.0,2.0,6),24
  end

  def test_cube_volume_common
    assert_equal OurFirstGem.cuboid_volume(2.0),8
  end

  def test_cuboid_negative
    assert_nil OurFirstGem.cuboid_volume(-2)
  end

  def test_cuboid_zero
    assert_nil OurFirstGem.cuboid_volume(0)
  end

  def test_cuboid_2_args
    assert_equal OurFirstGem.cuboid_volume(3, 4), 36, "Неуказанный аргумент считаем равным 1-му"
    assert_equal OurFirstGem.cuboid_volume(a=2, b=4), 16
    assert_equal OurFirstGem.cuboid_volume(a=2, c=4), 16
  end

  def test_cubeid_arg_type_err
    assert_nil OurFirstGem.cuboid_volume("lgsjk")
    assert_nil OurFirstGem.cuboid_volume(false)
  end

  def test_pyramid_volume_square
    assert_equal OurFirstGem.pyramid_volume(height=3, n=4, 5), 25
  end

  def test_pyramid_FFFF
    assert_nil OurFirstGem.pyramid_volume(-5, 3, 5)
  end

  def test_pyramid_zero
    assert_nil OurFirstGem.pyramid_volume(0, 0, 0)
  end

  def test_pyramid_arg_type_err
    assert_nil OurFirstGem.pyramid_volume("lgsjk", 3, 1)
    assert_nil OurFirstGem.pyramid_volume(false, 3, 1)
  end

  def test_pyramid_with_wrong_base
    assert_nil OurFirstGem.pyramid_volume(height=3, n=0, 5)
    assert_nil OurFirstGem.pyramid_volume(height=3, n=2, 5)
  end

end

# проверить, что все работает верно, если задать параллелепипед ровно двумя сторонами 