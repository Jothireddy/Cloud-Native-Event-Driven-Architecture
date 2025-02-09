import base64
import json

def lambda_handler(event, context):
    """
    Sample Lambda function to process records from Kinesis.
    For each record, it decodes the base64-encoded data and logs the payload.
    """
    print("Received event: " + json.dumps(event))
    for record in event.get("Records", []):
        # Kinesis data is base64 encoded so decode here
        payload = base64.b64decode(record["kinesis"]["data"]).decode('utf-8')
        print("Decoded payload: " + payload)
        # TODO: Add custom processing logic here
    return {
        "statusCode": 200,
        "body": json.dumps("Processing complete")
    }
