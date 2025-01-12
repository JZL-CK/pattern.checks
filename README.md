
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pattern.checks

<!-- badges: start -->
<!-- badges: end -->

The goal of `pattern.checks` is to identify entries with patterned
responses for psychometric scales. The patterns included in the package
are:

- **Identical responses**: e.g., `a, a, a`
- **Ascending responses**: e.g., `a, b, c`
- **Descending responses**: e.g., `c, b, a`
- **Alternative patterns**: e.g., `a, b, a, b` (ABAB)
- **Repeating sequences**: e.g., `a, b, c, a, b, c` (ABCABC)

## Installation

You can install the development version of `pattern.checks` like so:

``` r
# Install devtools if not already installed
install.packages("devtools")

# Use devtools to install the development version
devtools::install_github("JZL-CK/pattern.checks")

library(pattern.checks)
```

You can install the released version of `pattern.checks` from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("pattern.checks")
```

## Example

Here is a basic example demonstrating how to identify participants with
a specific pattern in their responses:

### Identical Responses

``` r
library(pattern.checks)

# Example dataset
data <- data.frame(
  V1 = c(1, 2, 3, 1, 1),
  V2 = c(1, 3, 2, 1, 1),
  V3 = c(1, 4, 1, 1, 1)
)

# Identify participants with identical responses across columns 1 to 3
result <- pattern.id(data, 1:3)
print(result)
#> $participants
#> [1] 1 4 5
#> 
#> $responses
#>   V1 V2 V3
#> 1  1  1  1
#> 4  1  1  1
#> 5  1  1  1
```

### Ascending Responses

``` r
# Identify participants with responses in ascending order
result <- pattern.as(data, 1:3)
print(result)
#> $participants
#> [1] 2
#> 
#> $responses
#>   V1 V2 V3
#> 2  2  3  4
```

### Descending Responses

``` r
# Identify participants with responses in descending order
result <- pattern.ds(data, 1:3)
print(result)
#> $participants
#> [1] 3
#> 
#> $responses
#>   V1 V2 V3
#> 3  3  2  1
```

### ABAB Pattern

``` r
# Identify participants with ABAB pattern responses
result <- pattern.abab(data, 1:3)
print(result)
#> $participants
#> integer(0)
#> 
#> $responses
#> [1] V1 V2 V3
#> <0 rows> (or 0-length row.names)
```

### ABCABC Pattern

``` r
# Identify participants with ABCABC pattern responses
result <- pattern.abcabc(data, 1:3)
print(result)
#> $participants
#> [1] 2 3
#> 
#> $responses
#>   V1 V2 V3
#> 2  2  3  4
#> 3  3  2  1
```

### Note

Each function returns a list with two elements:

- **`participants`**: A vector of row indices for participants with the
  specified pattern.
- **`responses`**: A data frame containing their responses for the
  specified columns.

For example, the output for `pattern.id` might look like this:

``` r
$participants
[1] 1 4

$responses
  V1 V2 V3
1  1  1  1
4  1  1  1
```

You can use these functions to systematically identify patterned
responses in psychometric data and address potential response biases.

### Reference

If you use the `pattern.checks` package in your research, please cite it
as:

> C K, J. (2025). pattern.checks: A package to identify patterned
> responses in psychometric scales. R package version 1.0. Available at:
> \[GitHub Repository Link\].

For any queries and suggestions, contact me via <jzlckclt@gmail.com>
