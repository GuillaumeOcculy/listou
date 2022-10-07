require "application_system_test_case"

class ProductListsTest < ApplicationSystemTestCase
  setup do
    @product_list = product_lists(:one)
  end

  test "visiting the index" do
    visit product_lists_url
    assert_selector "h1", text: "Product lists"
  end

  test "should create product list" do
    visit product_lists_url
    click_on "New product list"

    check "Favorited" if @product_list.favorited
    fill_in "Name", with: @product_list.name
    fill_in "Slug", with: @product_list.slug
    fill_in "User", with: @product_list.user_id
    click_on "Create Product list"

    assert_text "Product list was successfully created"
    click_on "Back"
  end

  test "should update Product list" do
    visit product_list_url(@product_list)
    click_on "Edit this product list", match: :first

    check "Favorited" if @product_list.favorited
    fill_in "Name", with: @product_list.name
    fill_in "Slug", with: @product_list.slug
    fill_in "User", with: @product_list.user_id
    click_on "Update Product list"

    assert_text "Product list was successfully updated"
    click_on "Back"
  end

  test "should destroy Product list" do
    visit product_list_url(@product_list)
    click_on "Destroy this product list", match: :first

    assert_text "Product list was successfully destroyed"
  end
end
