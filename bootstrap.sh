export APP_NAME=cdk-framework
export APP_DEPS='@aws-cdk/aws-ec2'

mkdir $APP_NAME
cd $APP_NAME
cdk init app --language=typescript

nvm use 12 # <-- nvm not found error
npm install --save $APP_DEPS

# configure stack