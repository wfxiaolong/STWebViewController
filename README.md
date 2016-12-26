## STWebViewController

![](https://img.shields.io/teamcity/http/teamcity.jetbrains.com/s/bt345.svg) ![](https://img.shields.io/badge/pod-support-blue.svg) ![](https://img.shields.io/github/license/mashape/apistatus.svg)


#### Description:

* This Lib depands on 'NJKWebViewProgress'.
* The important function is the swipe gesture.(Just like Wechat App does)
* The swift version will be done later.

#### Usage:

```
#import "STWebViewCOntroller.h"

STWebViewController *webC = [[STWebViewController alloc] initWithAddress:URLSTRING];
[self.navigationController pushViewController:webC animated:YES];
```


#### The demo's result:


![](./demo.gif)


#### License
<hr>

STWebViewController is under MIT License. See LICENSE file for more info from <a href="https://opensource.org/licenses/mit-license.php">here</a>;

