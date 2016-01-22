require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products #especify that only the products fixtures is going to be load in the test

  test "product attributes must not be empty" do
      product = Product.new #create a product with all fields equal to nil
      assert product.invalid?
      assert product.errors[:title].any?
      assert product.errors[:description].any?
      assert product.errors[:image_url].any?
      assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "My book title",
                          description: "yyyy",
                          image_url: "yyyy.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "My Book Title",
                description: "yyyy",
                price: 1,
                image_url: image_url)
  end

  test "image_url" do
    ok  = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid" # this 2 parameter from assert is a error message that adds the default one
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} should be invalid"
    end

  end

  test "product is not valid without a unique title" do
    # Obs: Here the ruby book fixture is load in the test database, and we define below
    # a product using the title from the ruby row on the test database
    product = Product.new(title: products(:ruby).title,
                          description: "yyyy",
                          price: 1,
                          image_url: "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title] # Page 89

  end

end
