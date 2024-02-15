# validate-sigma-rules

This action is used to validate Sigma rules using the JSON schema. It is used to ensure that the rules are correctly formatted and that they will work with the Sigma converter.

## Basic usage

For an example repository structure, see the [example repository](https://github.com/mostafa/validate-sigma-rules-example).

```yaml
steps:
    - uses: mostafa/validate-sigma-rules@v0
      with:
        path: './'
        schemaPath: 'https://raw.githubusercontent.com/SigmaHQ/sigma-specification/main/sigma-schema.json'
```

## Inputs

### `path` (optional)

The path to the Sigma rules in your repository. This is a optional input and should be a relative path to the root of the repository. The default value is `./`.

### `schemaPath` (optional)

The path to the JSON schema. This is an optional input and should be a URL to the JSON schema. The default value is using the latest version of the Sigma schema from the [sigma-specification repository](https://github.com/SigmaHQ/sigma-specification).

## Outputs

It returns a zero exit code if the validation is successful and a non-zero exit code and errors if the validation fails.

## Limitations

It currently only supports a single path to the rules. It does not support multiple paths or globs (for now).

## License

The scripts and documentation in this project are released under the [Apache-2.0 License](LICENSE).

## Contributions

Contributions are welcome! Just open an issue or a PR.
