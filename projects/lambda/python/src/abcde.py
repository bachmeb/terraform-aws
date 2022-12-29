import json


def xyz(event, context):
    return {
        "statusCode": 200,
        "body": json.dumps({
            "asdf": 123123
        })
    }
