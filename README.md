# validate-sigma-rules

This action is used to validate Sigma rules using the JSON schema. It is used to ensure that the rules are correctly formatted and that they will work with the Sigma converter.

## Basic usage

```yaml
steps:
    - uses: mostafa/validate-sigma-rules@v0
      with:
        path: './'
```

## Inputs

### `path`

The path to the Sigma rules in your repository. This is a optional input and should be a relative path to the root of the repository. The default value is `./`.

## Outputs

It returns a zero exit code if the validation is successful and a non-zero exit code and errors if the validation fails.

## License

The scripts and documentation in this project are released under the [Apache-2.0 License](LICENSE).

## Contributions

Contributions are welcome! Just open an issue or a PR.
