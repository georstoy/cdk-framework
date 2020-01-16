# Project goals
 - to provide structure for development of complex AWS CDK apps, by:
   - short files ( supporting code readability )
   - single-purpose files ( faster and smoother switch of alternative services, useful when testing out and adopting new services )
   - consistent structure ( accelerates old codebase maintainance as whole modules can be updated; convenient for mocking)

 - to reduse the setup time of a AWS CDK by creating a setup pipeline ( few scripts ),
    that do configure the app structure after the initial `cdk init`

### Framework init
`bootstrap.sh`
# App structure
 - bin
 - debug
 - lib
   - myapp-stack.ts
      - Declaration
        - Network
        - Database
        - REST API
      - Construction ( fill-in the declared constructs)
        - Network
        - Database
        - Controllers
        - Routing
      - Definition of methods used in Construction
        - Network
        - Database
        - Controllers
        - Routing
 - src
 - test
 tsconfig.json
 tslint.json

# Conventions and preferences
 - lambda.runtime: lambda.Runtime.NODEJS_12_X
 - single lambda handler per file

## MUST HAVE packages
```
npm install --save \
ts-lint \
```

# Debugging
## Pre-requisites

## Local debugging
### functions
`sam local invoke <function logical id> --debug-port <default = 5858>`
### api
`sam local start-api <function logical id> --debug-port <default = 5858>`