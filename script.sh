#!/bin/bash

# Get user input for the pip package name
read -p "Enter the pip package name: " package_name

# Create a directory with the name of the package
mkdir $package_name && cd $package_name

# Create a virtual environment
python3 -m venv venv
source venv/bin/activate

# Install the specified package using pip
pip install $package_name -t .

# Remove unnecessary files
rm -rf *dist-info

# Go back to the parent directory
cd ..

# Zip the package directory to create the layer
zip -r ${package_name}_lib_layer.zip $package_name

# Deactivate the virtual environment
deactivate

echo "Package $package_name has been zipped as ${package_name}_lib_layer.zip in the 'packages/$package_name' directory."

# Ask user if they want to upload the layer to AWS Lambda
read -p "Do you want to upload the layer to AWS Lambda? (y/n): " upload_option
if [ "$upload_option" == "y" ]; then
  # Get user input for the AWS Lambda layer name
  read -p "Enter the AWS Lambda layer name: " layer_name

  # Upload the layer to AWS Lambda using AWS CLI
  aws lambda publish-layer-version --layer-name $layer_name --description "Python library layer for $package_name" --zip-file fileb://${package_name}_lib_layer.zip

  echo "Successfully uploaded the layer $layer_name to AWS Lambda."
else
  echo "Skipping the upload to AWS Lambda."
fi
