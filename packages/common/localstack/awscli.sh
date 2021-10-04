shopt -s expand_aliases
alias aws-docker='docker run --network host --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
aws-docker --version

DIR="$HOME/.aws"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
  mkdir ${DIR}
  echo "
[default]
region = us-east-1
output = json
    " >> ${DIR}/config
  echo "
[default]
aws_access_key_id = 123
aws_secret_access_key = 12345
    " >> ${DIR}/credentials 
fi