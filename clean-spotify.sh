#!/bin/sh

function die {
	exit 1;
}
cd /opt/spotify/Apps || die
unzip -p xpui.spa xpui.js | sed 's/{adsEnabled:\!0}/{adsEnabled:false}/' > xpui.js || die
zip --update xpui.spa xpui.js || die
rm xpui.js || die

