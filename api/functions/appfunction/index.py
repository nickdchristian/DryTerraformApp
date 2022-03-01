def handler(event, context):
    """Dry Terraform Application function."""
    return {"statusCode": 200, "body": f"App Version: {context.function_version}"}
