# README

Project to try out rails. A simple web app to enter energy usages.
## Specs:
- A user can enter the energy usage of a meter in a certain period in kWh (default)
- A user can edit the energy usage of a meter
- A user can delete the energy usage of a meter
- A user can view a list of all energy usages per period for a meter
- A user can create a energy meter filling in the name, start and end dates
- A user can edit the name, start and end dates of the energy meter
- A manager can approve the energy usages
- A user can see if a energy usage is approved
- A user cannot edit or delete the energy usage if approved
- A user can select the time unit (days, weeks, months, years) that must be used for energy usages when creating a meter
- A user can select the energy unit (kWh, GJ) of a energy meter

## Todo
- Last two items from specs are not implemented
    - These are not essential for a minimal solution
    - I have chosen to select the period by entering the start of a period for now
- Restrict creating manager accounts in some way
- Check start date is before end date
- Check start of period start is within the before and end date

## Known problems
- Flash messages cannot be removed (Missing javascript?)
- Flash messages are sometimes green instead of red (when an error is added)
- Error messages do not display correct

## Time used:
- 2 hours: Reading about rails
- 3 hours: Initial setup + scaffolds
- 5.5 hours: Add CRUD operations for energy meter and usage
- 2 hours: Add users and managers
- 2.5 hours: Add toggle approve
- 1.5 hours: Finalize
- 0.5 hours: Deploy to heroku

Total: 17