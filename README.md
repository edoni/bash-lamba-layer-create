## Automate AWS Lambda Layer Creation and Deployment with .bash Script

This Bash script provides an easy way to create and upload Lambda Layers for Python packages installed via `pip`. It automates the process of creating a virtual environment, installing Python packages, zipping the package directory, and uploading the layer to AWS Lambda. 

### Prerequisites
- AWS CLI installed and configured with appropriate credentials for your AWS account.
- Bash shell environment.

### How to Use

1. Run the script in a Bash shell.
2. Enter the name of the Python package installed via `pip` when prompted.
3. The script creates a directory with the package name, sets up a virtual environment, installs the package using `pip`, and removes unnecessary files.
4. The package directory is then zipped to create the Lambda Layer.
5. Optionally, you can choose to upload the layer to AWS Lambda by entering 'y' when prompted. Provide the desired layer name.
6. If uploaded, the script uses AWS CLI to publish the layer to AWS Lambda.
7. The created Lambda Layer can now be used in multiple Lambda functions or shared with others.

### Benefits
- Avoid duplicating code in multiple Lambda functions by creating a shared Lambda Layer.
- Reduce the size of Lambda deployment packages, simplifying maintenance and updates.
- Optionally upload the created layer to AWS Lambda for easy distribution across multiple environments or sharing with other developers.

### Customization
- Modify the prompts, file paths, and AWS CLI commands in the script to suit your specific requirements.

Try out this script to streamline your AWS Lambda development workflow and simplify the creation and management of Lambda Layers for Python packages installed via `pip`!
