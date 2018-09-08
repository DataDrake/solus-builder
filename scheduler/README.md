# solus-scheduler
A web service for coordinating jobs between one or more builders and for 
providing public-facing feedback on their status.

## API

### Public
``` yaml
GET /
    Response:
        Content-Type: text/html
        Body: Summary of the last 25 jobs and status of builders(s)
```

### Private

#### Jobs
``` yaml
GET /api/v1/jobs
    Response:
        Content-Type: application/json
        Body: Page 1 with default offset of 25 jobs an an Array of Jobs

GET /api/v1/jobs/jobs?page=3&offset=10
    Query:
        page: the page number
        offset: the number of items per page
    Response:
        Content-Type: application/json
        Body: Specified page for the given offset as an Array of Jobs

POST /api/v1/jobs?package=nano
    Query:
        package: the name of the package to build
    Response:
        200: the job was created
        404: the package does not exist
        500: failed to create job

GET /api/v1/jobs/10
    Response:
        Content-Type: application/json
        Body: JSON description of the job 

PUT /api/v1/jobs/10?state=done
    Query:
        state: the state to set for an existing job (done, failed, cancelled)
    Response:
        200: the job's status was updated
        404: the job does not exist
        500: failed to update job
```
