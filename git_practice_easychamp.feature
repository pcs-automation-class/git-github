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

      | USD      | 4    |

      | USD      | 500    |
      | EUR      | 10     |
      | PLN      | 1000


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
      | 0.4   |
      | 5      |
      | 10     |

  Scenario: As a Manager I want be able to join a competition for free
    Given a Manager joins competition
    When Organaizer accepts request
    Then Manager sees their name owners competition

  Scenario: Prevent easychamp user from joining the same team as a manager in a fixed-fee competition
    Given an easychamp user has joined the fixed-fee competition as a Manager
    When they navigate to the teams on the competition page
    Then the team they joined is no longer available for joining as a Manager

  Scenario: in-app confirmation for successful STRIPE payment by easychamp user joining as a Manager in
  Fixed-Fee competition
    Given the registration for a fix-fee competition with the join as a Manager option is opened
    When an easychamp user chooses to pay with STRIPE to join the competition
    And they enter valid credit card payment information
    Then they receive in-app successful payment confirmation

  Scenario: PayPal option is available for an easychamp user joining as Manager in fixed-fee competition
    Given the registration for a free competition with the join as a Manager option is opened
    When an easychamp user chooses to join this competition as a Manager
    And they accept participation conditions
    Then the pay with PayPal option is available in the payment options window