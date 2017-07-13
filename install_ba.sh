#!/bin/bash

# download
revision=$1;

# get page html; find string, get build version
# grep and awk part is very shitty
buildVersion=$(curl -s http://10.177.176.213/hosted/$revision-QAT/ | grep -P "<th.*>Build (\d\d\d).* - Latest</th>" | awk '{print $6;}')

echo $buildVersion;

qatName="pentaho-business-analytics-${revision}-QAT-${buildVersion}-x64.bin"
qatUrl="http://build.pentaho.com/hosted/${revision}-QAT/${buildVersion}/${qatName}"

wget $qatUrl

# install
chmod 755 $qatName
printf '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ny\n\n\nroot\nroot\n\nn\nn\n' | ./$qatName
