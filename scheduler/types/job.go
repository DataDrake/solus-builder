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

// JobStatus describes the current status of a Job
type JobStatus uint8

const (
	// Idle jobs have not yet been assigned to a builder
	Idle JobStatus = 0
	// Running jobs are now being carried out
	Running JobStatus = 1
	// Completed jobs have finised successfully
	Completed JobStatus = 2
	// Failed jobs did not complete successfully
	Failed JobStatus = 3
)

// Job is a record of a Builder task
type Job struct {
	ID        int
	Task      Task
	Status    JobStatus
	User      string
	Created   time.Time
	Started   time.Time
	Finished  time.Time
	BuilderID int
}
