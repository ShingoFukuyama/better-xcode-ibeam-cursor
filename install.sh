#!/bin/bash

MYXCODE=/Applications/Xcode6.1.1.app
if [ ! -d "${MYXCODE}" ]; then
  echo "${MYXCODE} doesn't exist..."
  exit
fi

echo 'Downloading new image'
curl -o /tmp/DVTIbeamCursor.tiff https://raw.githubusercontent.com/ShingoFukuyama/better-xcode-ibeam-cursor/master/DVTIbeamCursor.tiff

echo 'Backing up the original cursor that ships with xcode to ./backup-DVTIbeamCursor.tiff'
cp ${MYXCODE}/Contents/SharedFrameworks/DVTKit.framework/Resources/DVTIbeamCursor.tiff ./backup-DVTIbeamCursor.tiff
echo 'Copying the improved ibeam cursor to the correct location'
sudo cp /tmp/DVTIbeamCursor.tiff ${MYXCODE}/Contents/SharedFrameworks/DVTKit.framework/Resources/DVTIbeamCursor.tiff

echo 'Removing downloaded image'
rm -f /tmp/DVTIbeamCursor.tiff

echo 'Done - restart Xcode and have fun!'
