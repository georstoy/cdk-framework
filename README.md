# Project goals
 - to provide structure for development of complex AWS CDK apps, by:
   - short files ( supporting code readability )
   - single-purpose files ( faster and smoother switch between concurrent services)
   - consistent structure ( confortable for mock; accelerates old codebase maintainance)

 - to reduse the setup time of a AWS CDK by creating a setup pipeline ( few scripts ),
    that do configure the app structure after the initial `cdk init`