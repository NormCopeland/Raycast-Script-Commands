#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Salesforce Page
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔧
# @raycast.argument1 { "type": "dropdown", "placeholder": "Client",  "data": [{"title":"Client1","value":"https://client1.my.salesforce.com"},{"title":"Client1 - Sandbox","value":"https://client1--sandbox.sandbox.my.salesforce.com"},{"title":"Client2","value":"https://client2.my.salesforce.com"}]}
# @raycast.argument2 { "type": "dropdown", "placeholder": "Page",  "data": [{"title":"Home","value":"/"},{"title":"Contacts","value":"/lightning/o/Contact/list"},{"title":"Accounts","value":"/lightning/o/Account/list"},{"title":"Setup Home","value":"/lightning/setup/SetupOneHome/home/"},{"title":"Service Setup Assistant","value":"/lightning/setup/ServiceHome/home"},{"title":"Multi-Factor Authentication Assistant","value":"/lightning/setup/MfaAssistant/home"},{"title":"Hyperforce Assistant","value":"/lightning/setup/HyperforceAssistant/home"},{"title":"Release Updates","value":"/lightning/setup/ReleaseUpdates/home"},{"title":"Lightning Experience Transition Assistant","value":"/lightning/setup/EnableLightningExperience/home"},{"title":"Salesforce Mobile App","value":"/lightning/setup/SalesforceMobileAppQuickStart/home"},{"title":"Installed Packages","value":"/lightning/setup/ImportedPackage/home"},{"title":"Dashboards","value":"/lightning/o/Dashboard/home"},{"title":"Flows","value":"/lightning/setup/Flows/home"},{"title":"Inbound Change Sets","value":"/lightning/setup/InboundChangeSet/home"},{"title":"Object Manager","value":"/lightning/setup/ObjectManager/home"},{"title":"Outbound Change Sets","value":"/lightning/setup/OutboundChangeSet/home"},{"title":"Permission Sets","value":"/lightning/setup/PermSets/home"},{"title":"Process Builder","value":"/lightning/setup/ProcessAutomation/home"},{"title":"Reports","value":"/lightning/o/Report/home?queryScope=mru"},{"title":"Sandboxes","value":"/lightning/setup/DataManagementCreateTestInstance/home"},{"title":"Users","value":"/lightning/setup/ManageUsers/home"},{"title":"Profiles","value":"/lightning/setup/EnhancedProfiles/home"},{"title":"App Manager","value":"/lightning/setup/NavigationMenus/home"},{"title":"Manage Connected Apps","value":"/lightning/setup/ConnectedApplication/home"},{"title":"Lightning App Builder","value":"/lightning/setup/FlexiPageList/home"},{"title":"Storage Usage","value":"/lightning/setup/CompanyResourceDisk/home"},{"title":"Sites","value":"/lightning/setup/CustomDomain/home"},{"title":"Remote Site Settings","value":"/lightning/setup/SecurityRemoteProxy/home"},{"title":"Trusted URLs","value":"/lightning/setup/SecurityCspTrustedSite/home"},{"title":"Deliverability","value":"/lightning/setup/OrgEmailSettings/home"},{"title":"Debug Logs","value":"/lightning/setup/ApexDebugLogs/home"},{"title": "Apex Jobs", "value": "/lightning/setup/AsyncApexJobs/home"}]}

# Documentation:
# @raycast.author NormC
# @raycast.authorURL https://raycast.com/NormC

# Determine the appropriate Arc space based on the URL
if [[ $1 == *"client1"* ]]; then
  space=2
  client="Client1"
elif [[ $1 == *"client2"* ]]; then
  space=3
  client="JFJ"
else
  space=1 # Default space if no specific client is matched
fi

# The URL to open
this_URL=$1$2

# To Open in default browser:
# open $this_URL

# AppleScript to open the URL in the specified Arc space
osascript <<EOF
tell application "Arc"
	tell front window
		tell space $space
			make new tab with properties {URL:"$this_URL"}
		end tell
		tell space $space to focus
	end tell
	activate
end tell
EOF

echo "URL opened in Arc space for $client!"