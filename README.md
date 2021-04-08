#  LaunchDarklyDemo

This is project demonstrates the use of feature flags with LaunchDarkly.

To use this project you will need to create a trial account with [LaunchDarkly](https://launchdarkly.com/). It uses a feature flag with the key "new-onboarding-screen". You can either create a feature flag with the same key in LaunchDarkly, or you can change the value for "featureFlagKey" in ViewController.swift
- When you create the feature flag make sure you check the box for  "SDKs using Mobile key"
- You'll also need to add your LaunchDarkly mobile key which can be found in the Projects tab of your account settings page on the LaunchDarkly website. In the Xcode project, the variable for that is called "mobileKey" in AppDelegate.swift

Once all that is done, in LaunchDarkly you can go to Featrue flags > Targeting, and then change the default rule from true to false and when you save the change, the UI in your app will update live, pretty cool!

Code overview:
- AppDelegate.swift:

    The mobileKey is configured with a string.
    `setUpLDClient()` creates a user, a configuration, and starts up the LaunchDarkly client.
    
- ViewController.swift:
    This tells the LaunchDarkly client to watch for changes in the value of the featurekey, and when a change is observed to call `updateLabel()`:
 `LDClient.get()?.observe(key: featureFlagKey, owner: self) { [weak self] changedFlag in
    self?.updateLabel(changedFlag.key)
}`
