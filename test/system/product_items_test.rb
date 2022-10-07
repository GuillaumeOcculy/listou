require "application_system_test_case"

class ProductItemsTest < ApplicationSystemTestCase
  setup do
    @product_item = product_items(:one)
  end

  test "visiting the index" do
    visit product_items_url
    assert_selector "h1", text: "Product items"
  end

  test "should create product item" do
    visit product_items_url
    click_on "New product item"

    fill_in "Category", with: @product_item.category
    fill_in "Name", with: @product_item.name
    fill_in "Position", with: @product_item.position
    fill_in "Product list", with: @product_item.product_list_id
    fill_in "Slug", with: @product_item.slug
    fill_in "Status", with: @product_item.status
    fill_in "User", with: @product_item.user_id
    click_on "Create Product item"

    assert_text "Product item was successfully created"
    click_on "Back"
  end

  test "should update Product item" do
    visit product_item_url(@product_item)
    click_on "Edit this product item", match: :first

    fill_in "Category", with: @product_item.category
    fill_in "Name", with: @product_item.name
    fill_in "Position", with: @product_item.position
    fill_in "Product list", with: @product_item.product_list_id
    fill_in "Slug", with: @product_item.slug
    fill_in "Status", with: @product_item.status
    fill_in "User", with: @product_item.user_id
    click_on "Update Product item"

    assert_text "Product item was successfully updated"
    click_on "Back"
  end

  test "should destroy Product item" do
    visit product_item_url(@product_item)
    click_on "Destroy this product item", match: :first

    assert_text "Product item was successfully destroyed"
  end
end
