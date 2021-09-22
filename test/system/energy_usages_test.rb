require "application_system_test_case"

class EnergyUsagesTest < ApplicationSystemTestCase
  setup do
    @energy_meter = energy_meters(:two)
    @energy_usage = energy_usages(:one)
 end

  test "visiting the index" do
    visit energy_meters_url
    click_on @energy_meter.name

    assert_selector "h2", text: "Energy Usages"
    assert_selector "td", text: @energy_usage.amount
  end

  test "creating a energy usage" do
    visit energy_meter_url(@energy_meter)
    click_on "New"

    fill_in "Amount", with: "1234.5"
    fill_in "Start of period", with: @energy_usage.period_start
    click_on "Create Energy usage"

    assert_text "Energy usage was successfully created"

    assert_selector "td", text: "1234.5"
  end

  test "updating a energy usage" do
    visit energy_meter_url(@energy_meter)
    within('tr', :text => @energy_usage.amount) do
      click_on "Edit", match: :first
    end

    fill_in "Amount", with: 1234.5
    fill_in "Start of period", with: @energy_usage.period_start
    click_on "Update Energy usage"

    assert_text "Energy usage was successfully updated"

    assert_selector "td", text: "1234.5"
  end

  test "updating a energy meter with incorrect data" do
    visit energy_meter_url(@energy_meter)
    within('tr', :text => @energy_usage.amount) do
      click_on "Edit", match: :first
    end

    fill_in "Amount", with: "Not a number"
    fill_in "Start of period", with: @energy_usage.period_start
    click_on "Update Energy usage"

    assert_text "Amount is not a number"
  end

  test "cancel update of a energy meter" do
    visit energy_meter_url(@energy_meter)
    within('tr', :text => @energy_usage.amount) do
      click_on "Edit", match: :first
    end
    click_on "Cancel"

    assert_selector "h2", text: "Energy Usages"
  end

  test "destroying a energy usage" do
    visit energy_meter_url(@energy_meter)
    page.accept_confirm do
      within('tr', :text => @energy_usage.amount) do
        click_on "Delete", match: :first
      end
    end

    assert_text "Energy usage was successfully deleted"
  end
end
