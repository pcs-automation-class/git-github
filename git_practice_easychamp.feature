Feature: Other

  Scenario: As a Manager I want be able to join a competition for free
    Given a Manager joins competition
    When Organaizer accepts request
    Then Manager sees their name owners competition

  Scenario: As a Manager I want be able to pay fixed fee for joining a competition
    Given a Manager joins competition
    And Organaizer accepts request
    Then Manager pays fee for participation
    And sees their name owners competition

  Scenario Outline: As an organizer I open registration to join as a player with Fixed fee
    Given a Pro account holder with stripe connected is on Championship Registration page
    When I submit form with  "<currency>""<amount>" fields for joining as a player  with Fixed fee
    Then registration process radio button "Open" is  checked
    Examples:
      | currency | amount |
      | EUR      | 10     |

  Scenario: As an organizer I set currency to join as a player with Fixed fee
    Given a Pro account holder with stripe connected is on Championship Registration page
    When I establish  join as a player with Fixed fee
    Then currencies are presented for choosing USD/EUR/PLN

  Scenario Outline: As an organizer I set amount to join as a player with Fixed fee
    Given a Pro account holder with stripe connected is on Championship Registration page
    When I establish  join as a player with Fixed fee
    Then I can set "<amount>"

    Examples:
      | amount |
      | 0.5    |
      | 5      |
      | 10     |
