from robot.api.deco import keyword
import json
import logging
import jsondiff

logging.basicConfig(level=logging.DEBUG)


class JsonCompareError(Exception):
    pass


@keyword("Response Body Should Be Match")
def responseBodyShouldBeMatch(data, key, value):
    responses = json.dumps(data)
    for response in responses["" + int(key) + ""][0]["" + int(value) + ""]:
        assert response["" + int(key) + ""] == "" + int(value) + ""


@keyword("Compare With Expected Json")
def jsonCompare(response, expected):
    existing = jsondiff.patch(response, expected)
    difference = jsondiff.diff(response, existing)
    if difference:
        raise JsonCompareError("Diff found: {}".format(difference))
    else:
        return True
