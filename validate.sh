#!/bin/bash

# Check if the check-jsonschema tool is installed
if ! command -v check-jsonschema &>/dev/null; then
    echo "check-jsonschema could not be found"
    echo "Please install it from PyPI using:"
    echo "pip install check-jsonschema"
    exit
fi

# Set the default values for the environment variables
if [ -z "${SIGMA_SCHEMA_PATH}" ]; then
    SIGMA_SCHEMA_PATH="https://raw.githubusercontent.com/SigmaHQ/sigma-specification/main/sigma-schema.json"
fi

if [ -z "${SIGMA_RULES_PATH}" ]; then
    # Get Sigma rules from the user-specified path
    FILES=$(find ${GITHUB_WORKSPACE}/${SIGMA_RULES_PATH} -type f -name "*.yml")
else
    # Get Sigma rules from the default paths
    FILES=$(find ./rules ./rules-compliance ./rules-dfir ./rules-emerging-threats ./rules-placeholder ./rules-threat-hunting -type f -name "*.yml")
fi

# If we are not running in a GitHub Action, set the default path to the repo root
if [ -z "${GITHUB_ACTION_PATH}" ]; then
    GITHUB_ACTION_PATH=${GITHUB_WORKSPACE}
fi

echo "Downloading the latest version of the sigma-schema.json"
wget ${SIGMA_SCHEMA_PATH} -O ${GITHUB_ACTION_PATH}/sigma-schema.json

echo "Validating Sigma rules against sigma-schema.json"
check-jsonschema --schemafile ${GITHUB_ACTION_PATH}/sigma-schema.json ${FILES}
