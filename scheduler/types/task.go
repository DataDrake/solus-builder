//
// Copyright 2018 Bryan T. Meyers <bryan@solus-project.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

package types

import (
    "time"
)

// TaskType specifies the kind of task to perform
type TaskType uint8

const (
    // Build tasks build a package as specified by name
    Build     TaskType = 0
    // Clean tasks perform a `solbuild delete-cache`
    Clean     TaskType = 1
    // DeepClean task perform a `solbuild delete-cache --all` and clean up cached eopkgs
    DeepClean TaskType = 2
    // Update performs a `solbuild update`
    Update    TaskType = 3
)

// Task is an operation to be performed by a Job
type Task struct {
    Type      TaskType
    Package   struct {
        Name    string
        Version string
        Release int
    }
}
