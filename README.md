# Ohrm-Login-Test-Case
This test case will mainly use robot framework using selenium library.
# Objective
This test validates the login functionality with various scenarios, ensuring that the system behaves correctly for:
Valid login.
Invalid credentials.
Empty credentials.
Mixed valid/invalid inputs.
Each test captures a screenshot to verify the results visually.

# Test Scenarios & Steps
# Scenario 1: Login with Valid Credentials
Input: Admin / admin123
Expected: User is redirected to the dashboard, and "Dashboard" should be visible on the page.
Screenshot: Capture the dashboard page.
# Scenario 2: Login with Invalid Credentials
Input: Invalid / invalid123
Expected: An "Invalid credentials" alert should appear.
Screenshot: Capture the error message.
# Scenario 3: Login with Empty Credentials
Input: No username and password entered.
Expected: Error messages should appear for both fields.
Screenshot: Capture the error message display.
# Scenario 4: Invalid Username & Valid Password
Input: Invalid username / valid password (admin123)
Expected: An "Invalid credentials" alert should appear.
# Scenario 5: Valid Username & Invalid Password
Input: Admin / invalid password (invalid123)
Expected: An "Invalid credentials" alert should appear.

