@ignore
Feature: Common - Common js functions to reuse in different feature files

  Scenario:

    * def now =
"""
function() {
return java.lang.System.currentTimeMillis()
}
"""

    * def uuid =
"""
function() {
return java.util.UUID.randomUUID() + ''
}
"""
# Random number generation
    * def randomValue = function(){ return Math.random().toString(36).replace(/[^a-z]+/g, '').substring(5) }