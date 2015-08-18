# ICAClient Chef cookbook

## Description

Chef cookbook that installs and configures the [ICAClient](https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-131.html)

## Requirements

* [Ubuntu 14.04 Desktop](http://ubuntu.com)
* [Citrix ICAClient](https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-131.html)
* [Chef](http://chef.io)

Tested with **Chef Client 12.3.0**, **Ubuntu 14.04** and **ICAClient 13.1**

This cookbook can be run on virtual machine as well.

## Recipes

### default

The default recipe installs the ICAClient, and configures it with Firefox

### cleanup

The cleanup recipe removes the deb file from the client, and empties the apt cache

## Usage

* Download the current ICAClient installer deb
* Put the deb file in the `files/` directory
* Set the `default['icaclient']['deb_file']` variable in the `attributes/default.rb` file, eg:
```
# attributes/default.rb
(...)
default['icaclient']['deb_file'] = 'icaclient_13.1.0.285639_amd64.deb'
(...)
```
* Add the recipe to your run list
```
{
  "run_list": [
    "recipe[icaclient]",
    "recipe[icaclient::cleanup]"
  ]
}
```
* Wait for a Chef client run

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Author: Tamas Molnar

Copyright 2015, Tamas Molnar.

Licensed under the Apache License, Version 2.0 (the "License")

You may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
