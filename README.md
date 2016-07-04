# The Mission

* Create a Rails app with a migration for an Agent model
* Create a rake task for reading, parsing and importing the TSV from its URL. 
* The import should not create duplicates if it is run multiple times
* It should silently skip over agents with invalid email addresses. 
* Descriptions contain HTML that should be stripped out.
