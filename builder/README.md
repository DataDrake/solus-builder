# solus-builder
Prototyping area for next-generation builder.

## API

### Private

#### Status
``` yaml
GET /api/v1/builder/status
    Response:
        Content-Type: application/json
        Body: JSON OBject representation of the builder's status
```

#### Cleaning
``` yaml
POST /api/v1/builder/clean
POST /api/v1/builder/clean?all=true
    Action: |
        Perform cleanup operations after the current job, but before requesting 
        the next job
    Query:
        all: if set to true, do a full cleanup
    Response:
        200: Cleanup completed successfully
        500: Cleanup did not complete successfully
```

#### Updating
``` yaml
POST /api/v1/builder/update
    Action: |
        Perform a solbuild update after the current job, but before requesting 
        the next job.
    Response:
        200: Update completed successfully
        500: Update did not complete successfully
```
