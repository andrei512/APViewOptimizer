APViewOptimizer
===============

helper for iOS development - it scans all views in the app and highlights the one that are not optimized (ex. opaque is set to NO)

Example
-------

```objective-c
...

#import "APViewOptimizer.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ...
    
    // scan all views
    [APViewOptimizer scan:self.window];
    
    [self.window makeKeyAndVisible];
    return YES;
}

```

Contribuitors 
-------------

@tspop
