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

## npm scripts in the package.json at the root folder
```
"vars": {
    "myLambda": <ARN from CloundFormation template.yml (e.g. wikiPageHandlerFF0F0999)>,
    "myLambdaDescription": "here's what my lambda do" 
},
"scripts": {
    "deploy": "npm run build && npm run test && cdk deploy",
    "debug": "npm run build && npm run debug:${npm_package_vars_myLambda}",
    "debug:${npm_package_vars_myLambda}": "sam local invoke ${npm_package_vars_myLambda} -e debug/event.json > debug/output.json",
    "build": "npm run build:TypeScript && npm run build:CloudFormation && npm runlint",
    "build:TypeScript": "tsc",
    "build:CloudFormation": "cdk synth --no-staging > template.yml",
    "lint": "tslint -c tslint.json --fix 'src/*.ts'",
    "test": "jest"
}
```
## .gitignore
```
template.yml
```

# Debugging
## Pre-requisites

## Local debugging
### functions
`sam local invoke <function logical id> --debug-port <default = 5858>`
### api
`sam local start-api <function logical id> --debug-port <default = 5858>`