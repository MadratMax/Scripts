param (	
	[string]$title,
	[string]$message
)

# Webhook URLs for Your Workspace section
$channel = 'https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX/'

#DD0000 - red vertical line
#00DD00 - green vertical line
#FFF700 - yellow vertical line

$body = @"
{
	"attachments":[
      {
         "fallback":"$title",
         "pretext":"$title",
         "color":"#00DD00",
         "fields":[
            {
               "title":"---",
               "value":"$message",
               "short":false
            }
         ]
      }
	]}
"@

$params = @{ Headers = @{ 'accept' = 'application/json' }
	Body = $body
	Method = 'Post'
	URI = $channel
	
Write-Host "Sending message to Slack"
Invoke-RestMethod @params