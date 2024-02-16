Feature: Organizer running requests

  Scenario Outline: Organizer Views Total of Manager's Requests to Join Free Competition
    Given easychamp users sent a requests to join free competition as a Manager
    When Organizer recieved  "<number>" of requests
    Then they view the "<number>" of requests next to the team
    Examples:
      | number |
      |   0    |
      |   1    |
      |   5    |

  Scenario: Organizer sees APPROVE/REJECT option on Manager's Request to Join Free Competition
    Given an easychamp user sent a request to join free competition as a Manager
    When Organizer recieved  that request
    Then they view that request with approve/reject option
    And date and time of that request

  Scenario: Manager  is assigned to the team if Organizer approve they request to join Free Competition
    Given Organizer recieved a request to join their free competition as a Manager
    When they approve that request
    Then they see the Manager name on a team page
    And a checkmark appears next to the team to which the Manager was assigned
    And approve option is no longer available for that request
