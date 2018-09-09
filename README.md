# solus-builder
Prototyping area for next-generation builder.

## Components

### Scheduler

**Primary Purpose:** Provides a centralized resource for manipulating and assigning work to Builders.

**Secondary Purposes:**

* Provides a public overview of what is taking place in the build environment
* Provides a private API to a Job database
* Will eventually coordinate parallel execution of multiple jobs by multiple builders

### Builder

**Primary Purpose:** Builds new packages for the Solus repository.

**Secondary Purposes:**

* Performs cleanup operations in order to responsibly use disk space
* Performs upgrades to the associated `solbuild` image.
* Provides a private API to be used by the scheduler to monitor cluster health.

### CLI

**Primary Purpose:** Allows users to manage Jobs via a single user interface.

**Secondary Purposes:**

* Allows authorized users to manage the maintenance of Builders.
* Provides command line reports of scheduler activities.
* Provides command line summaries of cluster health.

## License

Copyright 2018 Bryan T. Meyers <bryan@solus-project.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
