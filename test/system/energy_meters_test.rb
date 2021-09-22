require "application_system_test_case"

class EnergyMetersTest < ApplicationSystemTestCase
  setup do
    @energy_meter = energy_meters(:one)
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
    visit energy_meters_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Energy meter was successfully deleted"
  end
end
