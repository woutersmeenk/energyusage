require "application_system_test_case"

class EnergyMetersTest < ApplicationSystemTestCase
  setup do
    @energy_meter = energy_meters(:one)
  end

  test "visiting the index" do
    visit energy_meters_url
    assert_selector "h1", text: "Energy Meters"
  end

  test "creating a Energy meter" do
    visit energy_meters_url
    click_on "New Energy Meter"

    fill_in "End", with: @energy_meter.end
    fill_in "Name", with: @energy_meter.name
    fill_in "Start", with: @energy_meter.start
    click_on "Create Energy meter"

    assert_text "Energy meter was successfully created"
    click_on "Back"
  end

  test "updating a Energy meter" do
    visit energy_meters_url
    click_on "Edit", match: :first

    fill_in "End", with: @energy_meter.end
    fill_in "Name", with: @energy_meter.name
    fill_in "Start", with: @energy_meter.start
    click_on "Update Energy meter"

    assert_text "Energy meter was successfully updated"
    click_on "Back"
  end

  test "destroying a Energy meter" do
    visit energy_meters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Energy meter was successfully destroyed"
  end
end
