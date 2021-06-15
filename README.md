# Getting started with Terraform 

### Step 1: Download the binary for terraform from below link
`https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip`

### Step 2: Extract the binary using unzip command
`unzip /terraform_0.15.5_linux_amd64.zip`

### Step 3: Set the path for the terraform 
`You need to add it to your ~/.profile or ~/.bashrc file. 
export PATH="$PATH:/path/to/dir"`

Depending on what you're doing, you also may want to symlink to binaries:

cd /usr/bin
sudo ln -s /path/to/binary binary-name

Note that this will not automatically update your path for the remainder of the session. To do this, you should run:

`source ~/.profile 
or
source ~/.bashrc`

# Configuration Syntax 

The syntax of Terraform configurations is called HashiCorp Configuration Language (HCL). 
It is meant to strike a balance between human readable and editable as well as being machine-friendly. 
For machine-friendliness, Terraform can also read JSON configurations. 

# Terraform Syntax

Here is an example of Terraform's HCL syntax:

An AMI
```
variable "ami" {
  description = "the AMI to use"
}
```


/* A multi
   line comment. */
resource "aws_instance" "web" {
  ami               = "${var.ami}"
  count             = 2
  source_dest_check = false

  connection {
    user = "root"
  }
}

1.Single line comments start with #

2.Multi-line comments are wrapped with /* and */

3.Values are assigned with the syntax of key = value (whitespace doesn't matter). 
The value can be any primitive (string, number, boolean), a list, or a map.

4.Strings are in double-quotes.

5.Strings can interpolate other values using syntax wrapped in ${}, such as ${var.foo}.

6.Multiline strings can use shell-style "here doc" syntax, with the string starting with a marker like <<EOF and then the string ending with EOF on a line of its own. 
The lines of the string and the end marker must not be indented.

7.Numbers are assumed to be base 10. If you prefix a number with 0x, it is treated as a hexadecimal number.

8.Boolean values: true, false.

9.Lists of primitive types can be made with square brackets ([]). Example: ["foo", "bar", "baz"].

10.Maps can be made with braces ({}) and colons (:): { "foo": "bar", "bar": "baz" }. 
Quotes may be omitted on keys, unless the key starts with a number, in which case quotes are required. 
Commas are required between key/value pairs for single line maps. A newline between key/value pairs is sufficient in multi-line maps.
