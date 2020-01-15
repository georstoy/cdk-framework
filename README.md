# Project goals
 - to provide structure for development of complex AWS CDK apps, by:
   - short files ( supporting code readability )
   - single-purpose files ( faster and smoother switch between concurrent services)
   - consistent structure ( confortable for mock; accelerates old codebase maintainance)

 - to reduse the setup time of a AWS CDK by creating a setup pipeline ( few scripts ),
    that do configure the app structure after the initial `cdk init`

# npm scripts in the package.json at the root folder
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

# App structure
 - bin
 - debug
 - lib
   - network
   - database
   - controllers
   - routing
 - src
 - test
 tsconfig.json
 tslint.json
