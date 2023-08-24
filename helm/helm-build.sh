#/bin/bash

find . -mindepth 1 -maxdepth 1 -type d |
while IFS= read -r package_directory; do
    package_name=$(basename "$package_directory")
    echo $package_name
    cd $package_name
    helm dependency update .
    helm dependency build .
    cd ../
done