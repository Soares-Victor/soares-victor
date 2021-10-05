#! /bin/bash

cd ../
cd ./templates/ || exit
printf "Please select folder:\n"
select TEMPLATE_TO_USE in *; do test -n "$TEMPLATE_TO_USE" && break; echo ">>> Invalid Template"; done
cd ../

cd ./packages/ || exit
printf "Select a package to create. New package? type [new]:\n"
select PACKAGE_TARGET in *; do test -n "$PACKAGE_TARGET" && break; printf "Type new package name. Ex: (company, tariff): " && break; done
cd ../
if [ -z "$PACKAGE_TARGET" ]; then
    read -r PACKAGE_TARGET
fi

printf "Type the name of application. Will be the same name to folder. Ex: (ui-product, ms-people): "
read -r SERVICE_FOLDER_NAME

# shellcheck disable=SC2059
printf "\nThe follow information is correct? [Y/n]\nTemplate: $TEMPLATE_TO_USE \nPackage Target: $PACKAGE_TARGET \nApplication and Folder name: $SERVICE_FOLDER_NAME\n"
read -r confirmation
if [ "$confirmation" == "Y" ]; then
    printf "Creating...\n"
    mkdir -p ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}"
    cp -a ./templates/"${TEMPLATE_TO_USE,,}"/* ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}"
    cd ./packages/"${PACKAGE_TARGET,,}"/"${SERVICE_FOLDER_NAME,,}" || exit
    find . -type f -exec sed -i "s/common/${PACKAGE_TARGET,,}/" {} \;
    find . -type f -exec sed -i "s/Common/${PACKAGE_TARGET,,}/" {} \;
    printf "Done!\n"
fi
printf "Exit!\n"
exit
