Feature: Merge Articles
  As a blog administrator
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully merge articles
    Given I am on the articles list page
    When I follow "Edit"
    Then I should see the input "merge_with" with label "Article ID"
    Then I merge the article "2"
