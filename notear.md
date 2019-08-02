# Quick fix for tearing on GNOME (< 3.30):
* Open `looking glass` pressing `ALT+F2` then `lg`
* Type:
* `Meta.disable_unredirect_for_screen(global.screen);`

### For GNOME >=3.30
* Open `looking glass` pressing `ALT+F2` then `lg`
* Type:
* `Meta.disable_unredirect_for_display(global.display);`
+ From [source code](https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect/blob/master/unredirect%40vaina.lt/extension.js#L9)
`

This will fix screen tearing at the cost of performance/heat!
