#! /bin/bash

#red=$(tput setaf 1)
#green=$(tput setaf 2)
#reset=$(tput sgr0)
#tput setaf 1; echo "red text green text"

cd ../
cd ./templates/ || exit
printf "Please select a template:\n"
select TEMPLATE_TO_USE in *; do test -n "$TEMPLATE_TO_USE" && break; tput setaf 1;echo ">>> Invalid Template";tput sgr0; done
tput sgr0;
cd ../


selectingPackage="1"
re='^[0-9]+$'
cd ./packages/ || exit
while [ $selectingPackage == "1" ]; do
  tput sgr0;
  printf "Select a package to create. If not in the list, type a name to create a new:\n";
  dirs=(*)
  declare -i i=0
  for dir in "${dirs[@]}";
  do
    i+=1
    echo "$i) $dir";
  done
  read -r PACKAGE_TARGET
  if [[ $PACKAGE_TARGET =~ $re ]] ; then
    if [[ " ${dirs[*]} " == *" ${dirs[${PACKAGE_TARGET#0}-1]} "* ]]; then
      PACKAGE_TARGET="${dirs[${PACKAGE_TARGET#0}-1]}"
      selectingPackage="0"
    else
      tput setaf 1;
      printf ">>> Invalid Package!\n"
    fi
  else
    selectingPackage="0"
  fi
done
tput sgr0;
cd ../

# cd ./packages/ || exit
# printf "Select a package to create. New package? type [new]:\n"
# select PACKAGE_TARGET in *; do test -n "$PACKAGE_TARGET" && break; printf "Type new package name. Ex: (company, tariff): " && break; done
# cd ../
# if [ -z "$PACKAGE_TARGET" ]; then
#     read -r PACKAGE_TARGET
# fi

printf "Type the name of application. Will be the same name to folder. Ex: (ui-product, ms-people): "
read -r SERVICE_FOLDER_NAME

tput setaf 2
# shellcheck disable=SC2059
printf "\n#####################################\nTemplate: $TEMPLATE_TO_USE \nPackage Target: $PACKAGE_TARGET \nApplication and Folder name: $SERVICE_FOLDER_NAME\n#####################################\n"
tput sgr0;
printf "The follow information is correct? [Y/n]";
read -r confirmation
if [ "$confirmation" == "Y" ]; then
   tput setaf 2; printf "Creating...\n"
   mkdir -p ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}"
   cp -a ./templates/"${TEMPLATE_TO_USE,,}"/* ./templates/"${TEMPLATE_TO_USE,,}"/.env ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}"
   cd ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}" || exit
   find . -type f -exec sed -i "s/common/${PACKAGE_TARGET,,}/" {} \;
   find . -type f -exec sed -i "s/Common/${PACKAGE_TARGET,,}/" {} \;
   find . -type f -exec sed -i "s/serviceName/${SERVICE_FOLDER_NAME,,}/" {} \;
   find . -type f -exec sed -i "s/packageName/${PACKAGE_TARGET,,}/" {} \;
   tput setaf 2; printf "Done!\n"
fi
tput sgr0;
printf "Exit!\n"
exit
