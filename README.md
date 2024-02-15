# Fuzzing Web URLs Script

Overview
This script, fuzz.sh, is a versatile tool designed for web URL fuzzing. It allows users to send HTTP requests to a specified URL, replacing the keyword "FUZZ" with words from a dictionary. The script supports various functionalities such as custom dictionary usage and defining positive server response codes.

Usage
Help
To display the script's help information, use the following command:

```./fuzz.sh -h```


Fuzzing URL
To start fuzzing at a specific URL, use the -u parameter. The URL must include the keyword "FUZZ," which will be replaced during fuzzing. This parameter is mandatory, except when displaying help.

```./fuzz.sh -u https://example.com/FUZZ.php```


Custom Dictionary
You can specify a custom dictionary file using the optional -w switch. The dictionary file should contain words, with each word on a separate line.

```./fuzz.sh -u https://example.com/FUZZ.php -w /path/to/custom/dictionary.txt```


Positive Response Codes
The optional -c switch allows you to define return codes considered as positive server responses. By default, only the code 200 is considered positive.

./fuzz.sh -u https://example.com/FUZZ.php -c 200,301,404
