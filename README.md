# Youtube Music Automation

Here was the source code for music.youtube.com. The automation test was build based on `selenium` using `robot-framework` as the framework, it has `.robot` script and it's configuration, robot framework are based paython

Add Diff Here

## Requirements

 - [ChromeDriver](https://chromedriver.chromium.org/)
 - [Selenium](https://pypi.org/project/selenium/)
 - [Python3](https://www.python.org/downloads/)
 - [RobotFramework](https://pypi.org/project/robotframework/)
 - [optional] [pipenv](https://pipenv.pypa.io/en/latest/)
 - [optional] [venv](https://docs.python.org/3/library/venv.html)


## Pip Requirements

- urllib3
- selenium
- lxml
- requests
- robotframework
- robotframework-appiumlibrary
- robotframework-faker
- robotframework-seleniumlibrary
- robotframework-selenium2library
- robotframework-pabot
- robotframework-debuglibrary
- robotframework-requests
- robotframework-xvfb


## Documentation Of The Test

- Login Suite:
    - Able To Login On Web music.youtube.com Use Google Account
    - Player TC 2
- Player:
    - Player TC 1
    - Plater TC 2

## Environment Setup

After clone the project, you need to set-up the environtment and installing libs using pip

Activate env version manager, you can activate pipenv / venv / or just without them

`pip install -r requirements.txt`

Checking the list:

`pip list`

Make sure no error instalation or broken lib package, it could be happen because of the network issues or the depedency server



## Run The Test

Make sure if you are using `venv` or using `pipenv` was activate `source venv/bin/activate` or pipenv on the project folder

Command to run the test (make sure you are on the project folder):

To run all the test:

`robot -d test_result Suites/`

To run specific test-suite:

`robot -d test_result Suites/<test-file-name>`

`robot -d test_result Suites/LoginScenarioTest`

To run specific test-case:

`robot -d test_result -t "<test-case-name>" Suites/`

`robot -d test_result -t "Able To Login On Web music.youtube.com Use Google Account" Suites/`

## Flaky Posibility

- Randomly ads, because there are have ads with 3 or 2 or only 1 shown in player` (non subs user)`
- Network connection problem
