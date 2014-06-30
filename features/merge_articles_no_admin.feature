Feature: Merge Articles
  As a blog administrator
  I want to be able to merge articles

  Background:
    Given the blog has an editor user
    And I am logged in as an editor into the admin panel

  Scenario: Don't see merge articles
    Given I am on the articles list page
    When I follow "Edit"
    Then I should not see the input "merge_with" with label "Article ID"
