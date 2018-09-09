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

