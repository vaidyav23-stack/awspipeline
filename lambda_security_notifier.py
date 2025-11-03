import json
import boto3
import urllib.parse
import os
import base64
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication
from datetime import datetime

def handler(event, context):
    s3 = boto3.client('s3')
    ses = boto3.client('ses')
    
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = urllib.parse.unquote_plus(record['s3']['object']['key'])
        
        try:
            # Get the security report
            response = s3.get_object(Bucket=bucket, Key=key)
            report_content = response['Body'].read()
            
            # Determine report type
            report_type = "OWASP" if "owasp" in key.lower() else "Trivy"
            
            # Create and send email with attachment
            send_email_with_attachment(
                ses, 
                report_type, 
                key, 
                report_content
            )
            
        except Exception as e:
            print(f"Error processing {key}: {str(e)}")
    
    return {'statusCode': 200}

def send_email_with_attachment(ses, report_type, key, report_content):
    sender = os.environ['SENDER_EMAIL']
    recipients = os.environ['RECIPIENT_EMAILS'].split(',')
    
    # Create message
    msg = MIMEMultipart()
    msg['From'] = sender
    msg['To'] = ', '.join(recipients)
    msg['Subject'] = f"Security Scan Report - {report_type}"
    
    # Email body
    body = f"""
Security scan completed.

Report Type: {report_type}
File: {key}
Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

Please find the detailed report attached.
"""
    
    msg.attach(MIMEText(body, 'plain'))
    
    # Attach the report file
    filename = key.split('/')[-1]
    attachment = MIMEApplication(report_content)
    attachment.add_header('Content-Disposition', 'attachment', filename=filename)
    msg.attach(attachment)
    
    # Send email
    ses.send_raw_email(
        Source=sender,
        Destinations=recipients,
        RawMessage={'Data': msg.as_string()}
    )

