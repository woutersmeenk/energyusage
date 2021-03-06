require "application_system_test_case"

class EnergyMetersTest < ApplicationSystemTestCase
  setup do
    @energy_meter = energy_meters(:one)
    @energy_meter_with_energy_usages = energy_meters(:two)
    @user = users(:user)

    visit root_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "testtest"
    click_on "Log in"
  end

  test "visiting the index" do
    visit energy_meters_url
    assert_selector "h1", text: "Energy Meters"
    assert_selector "td", text: @energy_meter.name
  end

  test "creating a energy meter" do
    visit energy_meters_url
    click_on "New"

    fill_in "End", with: @energy_meter.end
    fill_in "Name", with: "Another Meter"
    fill_in "Start", with: @energy_meter.start
    click_on "Create Energy meter"

    assert_text "Energy meter was successfully created"
    click_on "Back"

    assert_selector "td", text: "Another Meter"
  end

  test "updating a energy meter" do
    visit energy_meters_url
    click_on "Edit", match: :first

    fill_in "End", with: @energy_meter.end
    fill_in "Name", with: "Another Meter"
    fill_in "Start", with: @energy_meter.start
    click_on "Update Energy meter"

    assert_text "Energy meter was successfully updated"
    click_on "Back"

    assert_selector "td", text: "Another Meter"
  end

  test "updating a energy meter with incorrect data" do
    visit energy_meters_url
    click_on "Edit", match: :first

    fill_in "End", with: ""
    fill_in "Name", with: "Another Meter"
    fill_in "Start", with: @energy_meter.start
    click_on "Update Energy meter"

    assert_text "End must be a valid date"
  end

  test "cancel update of a energy meter" do
    visit energy_meters_url
    click_on "Edit", match: :first
    click_on "Cancel"

    assert_selector "h1", text: "Energy Meters"
  end

  test "deleting a energy meter" do
    visit energy_meter_url(@energy_meter)
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Energy meter was successfully deleted"
  end

  test "deleting a energy meter with energy usage" do
    visit energy_meter_url(@energy_meter_with_energy_usages)
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Energy meter could not be deleted"
  end
end
