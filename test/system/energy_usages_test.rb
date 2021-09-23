require "application_system_test_case"

class EnergyUsagesTest < ApplicationSystemTestCase
  setup do
    @energy_meter = energy_meters(:two)
    @energy_usage = energy_usages(:one)
    @approved_energy_usage = energy_usages(:three)

    @user = users(:user)
    @manager = users(:manager)

    visit root_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "testtest"
    click_on "Log in"
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

  test "approve a energy usage" do
    click_on "Log out"
    fill_in "Email", with: @manager.email
    fill_in "Password", with: "testtest"
    click_on "Log in"

    visit energy_meter_url(@energy_meter)
    within('tr', :text => @energy_usage.amount) do
      click_on "Approve", match: :first
    end

    assert_text "Energy usage was successfully updated"

    within('tr', :text => @energy_usage.amount) do
      assert_selector "td", text: "Yes"
      assert has_link?("Edit")
      assert has_link?("Delete")
    end

    visit energy_meter_url(@energy_meter)
    within('tr', :text => @energy_usage.amount) do
      click_on "Unapprove", match: :first
    end

    assert_text "Energy usage was successfully updated"

    within('tr', :text => @energy_usage.amount) do
      assert_selector "td", text: "No"
    end
  end

  test "no approve button exists for a normal user" do
    visit energy_meter_url(@energy_meter)

    assert has_no_link?("Approve")
    assert has_no_link?("Unapprove")
  end

  test "no edit or delete button exists for a approved energy usages" do
    visit energy_meter_url(@energy_meter)

    within('tr', :text => @approved_energy_usage.amount) do
      assert has_no_link?("Edit")
      assert has_no_link?("Delete")
    end
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
