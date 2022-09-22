# Rs3com

Rs3com provides a set of useful tools for [S3COM](https://github.com/odrans/S3COM):

- `nml_load_default` returns a list of default namelist variables needed by S3COM
- `nml_write` writes a namelist file that can be used directly as S3COM input
- `s3com_run` runs S3COM on a specific namelist file


## Installation

Rs3com is a [R](https://www.r-project.org/) package. It is not available on CRAN but can be installed by using the `devtools` package:

```R
devtools::install_github("odrans/Rs3com")
```
