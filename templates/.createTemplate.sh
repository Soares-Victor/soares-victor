#! /bin/bash

cd ../
cd ./templates/ || exit
printf "Please select folder:\n"
select TEMPLATE_TO_USE in *; do test -n "$TEMPLATE_TO_USE" && break; echo ">>> Invalid Template"; done
cd ../


selectingPackage="1"
re='^[0-9]+$'
cd ./packages/ || exit
while [ $selectingPackage == "1" ]; do
  printf "Select a package to create. New package? type [new]:\n";
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
      printf ">>> Invalid Template!\n"
    fi
  else
    selectingPackage="0"
  fi
done
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

# shellcheck disable=SC2059
printf "\n#####################################\nTemplate: $TEMPLATE_TO_USE \nPackage Target: $PACKAGE_TARGET \nApplication and Folder name: $SERVICE_FOLDER_NAME\n#####################################\nThe follow information is correct? [Y/n]"
read -r confirmation
if [ "$confirmation" == "Y" ]; then
   printf "Creating...\n"
   mkdir -p ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}"
   cp -a ./templates/"${TEMPLATE_TO_USE,,}"/* ./templates/"${TEMPLATE_TO_USE,,}"/.env ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}"
   cd ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}" || exit
   find . -type f -exec sed -i "s/common/${PACKAGE_TARGET,,}/" {} \;
   find . -type f -exec sed -i "s/Common/${PACKAGE_TARGET,,}/" {} \;
   find . -type f -exec sed -i "s/serviceName/${SERVICE_FOLDER_NAME,,}/" {} \;
   find . -type f -exec sed -i "s/packageName/${PACKAGE_TARGET,,}/" {} \;
   printf "Done!\n"
fi
printf "Exit!\n"
exit
