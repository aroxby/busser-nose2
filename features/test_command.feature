Feature: Test command
  In order to run tests written with nose2
  As a user of Busser
  I want my tests to run when the nose2 runner plugin is installed

  Background:
    Given a test BUSSER_ROOT directory named "busser-nose2-test"
    When I successfully run `busser plugin install busser-nose2 --force-postinstall`
    Given a suite directory named "nose2"

  Scenario: A passing test suite
    Given a file in suite "nose2" named "<YOUR_FILE>" with:
    """
    TEST FILE CONTENT

    A good test might be a simple passing statement
    """
    When I run `busser test nose2`
    Then I should verify some output for the nose2 plugin
    And the exit status should be 0

  Scenario: A failing test suite
    Given a file in suite "nose2" named "<YOUR_FILE>" with:
    """
    TEST FILE CONTENT

    A good test might be a failing test case, raised exception, etc.
    """
    When I run `busser test nose2`
    Then I should verify some output for the nose2 plugin
    And the exit status should not be 0
