Usage: cucumber env=high-dog features/registration.feature

Prerequisite:

Best Practice: Use environment variables for Authentication

https://wiki.saucelabs.com/display/DOCS/Best+Practice%3A+Use+Environment+Variables+for+Authentication+Credentials

Establish secure tunnel to access internal QA Environment

https://notonthehighstreet.atlassian.net/wiki/display/QA/SauceLabs

Please refer config-> cucumber.yml file for Browser option(BROWSER_OPT)

Execution:

By using cucumber command

To run locally

ex BROWSER_OPT=FIREFOX_OSX_10 ENV_ID="shared" TEST_ENV="local" bundle exec cucumber features --tag @3.04
To run in Sauce Cloud

 ex BROWSER_OPT=FIREFOX_OSX_10 ENV_ID="shared" bundle exec cucumber features --tag @3.04
By using rake task and run just one test scenario(Currently runs on four browser profiles concurrently)

 ENV_ID='Shared' TEST_NO=@1.01(optional) rake :all
By using rake task and run all the scenarios in the feature(Currently runs on four browser profiles concurrently)

 ENV_ID='Shared' rake :all

