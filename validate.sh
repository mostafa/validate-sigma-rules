#!/bin/bash

# Check if the check-jsonschema tool is installed
if ! command -v check-jsonschema &>/dev/null; then
    echo "check-jsonschema could not be found"
    echo "Please install it from PyPI using:"
    echo "pip install check-jsonschema"
    exit
fi

# Validate all the Sigma rules in the current directory
echo "Validating Sigma rules against sigma-schema.json"
check-jsonschema --schemafile sigma-schema.json $(find ${SIGMA_RULES_PATH} -type f -name "*.yml")
