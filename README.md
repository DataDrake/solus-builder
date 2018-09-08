# solus-builder
Prototyping area for next-generation builder.

## API

### Public
GET /

### Private

#### Jobs
GET /api/v1/jobs
    Response: Page 1 with default offset of 25 jobs

GET /api/v1/jobs/jobs?page=3&offset=10

POST /api/v1/jobs?package=nano

GET /api/v1/jobs/10
    Response: JSON description of the job 

PUT /api/v1/jobs/10?state=done
PUT /api/v1/jobs/10?state=failed
PUT /api/v1/jobs/10?state=cancelled

#### Builder
GET /api/v1/builder/status

POST /api/v1/builder/clean
POST /api/v1/builder/clean?all=true

POST /api/v1/builder/update
