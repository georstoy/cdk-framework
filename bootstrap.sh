######################################
# App Init                           #
######################################
export APP_NAME=cdk-framework
mkdir $APP_NAME && cd $APP_NAME

cdk init app --language=typescript

nvm use 12 # <-- nvm not found error

#######################################
# Framework Config/Setup              #
#######################################

# Linter
export LINTER='ts-lint'
npm install --save $LINTER

echo '{
    "defaultSeverity": "error",
    "extends": [
        "tslint:recommended"
    ],
    "jsRules": {},
    "rules": {
        "object-literal-sort-keys": false
    },
    "rulesDirectory": []
}' >> tslint.json

#######################################
# App Config/Setup                    #
#######################################

export APP_DEPS='\
@aws-cdk/aws-ec2 \
'

npm install --save $FRAMEWORK_DEPS;
npm install --save $APP_DEPS

# configure stack