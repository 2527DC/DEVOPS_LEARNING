# Terraform Provisioners & HashiCorp Vault

## 1. What are Provisioners in Terraform?


**Provisioners** are used in Terraform to execute scripts or file uploads on a local or remote machine as part of the resource creation or destruction process. They are typically used for bootstrapping, configuration management, and initial setup of a resource (e.g., an EC2 instance, a virtual machine, or database).

> [!WARNING]
> **Use Provisioners as a Last Resort!**
> HashiCorp recommends using provisioners only when there is no other option. Instead, you should prefer:
> - **Cloud-init / user_data**: To bootstrap virtual machines.
> - **Config Management Tools**: Ansible, Chef, Puppet, or SaltStack.
> - **Custom Images**: Pre-baked images using Packer.
>
> **Why?** Provisioners do not follow Terraform's declarative model. They do not record state for the actions they perform on the target machine, making debugging and drift detection extremely difficult.

---

## 2. Types of Provisioners

Terraform supports three primary types of provisioners:

### A. `local-exec` Provisioner
The `local-exec` provisioner invokes a local executable (script, command, or binary) on the machine running Terraform (your laptop or CI/CD runner) rather than on the resource itself.

#### Key Use Cases:
- Running local scripts (Bash, Python, PowerShell) to notify external systems.
- Saving output data locally (e.g., writing IP addresses to an inventory file).
- Triggering configuration management tools like Ansible locally.

#### Example:
```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  # Run local-exec to save public IP to a local file
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }
}
```

---

### B. `remote-exec` Provisioner
The `remote-exec` provisioner invokes a script or command on a remote resource after it is created. This requires connection details (SSH or WinRM).

#### Key Use Cases:
- Installing software packages (e.g., `apt-get install nginx`).
- Starting, stopping, or configuring services.
- Running configuration scripts inside the target VM.

#### Example:
```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "my-key"

  # Establish connection for remote provisioners
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/my-key.pem")
    host        = self.public_ip
  }

  # Run commands on the newly created remote EC2 instance
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}
```

---

### C. `file` Provisioner
The `file` provisioner copies files or directories from the machine running Terraform to the newly created resource. This also requires connection details (SSH or WinRM).

#### Key Use Cases:
- Uploading configuration files (e.g., `nginx.conf`, `appsettings.json`).
- Copying application binaries or source code to the remote server.

#### Example:
```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/my-key.pem")
    host        = self.public_ip
  }

  # Copy a local config file to the remote instance
  provisioner "file" {
    source      = "conf/nginx.conf"
    destination = "/etc/nginx/nginx.conf"
  }
}
```

---

## 3. Execution Mechanics & Behaviors

### Creation-Time vs. Destroy-Time Provisioners

1. **Creation-Time Provisioners (Default)**:
   - Run during the **creation** phase (`terraform apply`).
   - If a creation-time provisioner fails, the resource is marked as **tainted**. A tainted resource will be destroyed and recreated on the next `terraform apply`.

2. **Destroy-Time Provisioners**:
   - Run during the **destruction** phase (`terraform destroy` or when updating a resource that requires recreation).
   - Indicated by setting `when = destroy`.
   - Run **before** the resource itself is destroyed. If they fail, Terraform halts the destroy process.

#### Example of Destroy-Time Provisioner:
```hcl
resource "aws_instance" "web" {
  # ...
  
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Instance is being destroyed'"
  }
}
```

### Handling Failures (`on_failure`)
By default, provisioners fail if the command returns a non-zero exit code. You can control this behavior using the `on_failure` attribute:
- `fail` (Default): Halt the execution, mark the resource as tainted, and fail the apply.
- `continue`: Ignore the error and continue with the creation/destruction of other resources.

#### Example:
```hcl
provisioner "local-exec" {
  command    = "echo 'This might fail' && exit 1"
  on_failure = continue
}
```

---

## 4. HashiCorp Vault Integration

**HashiCorp Vault** is a secure tool for identity-based secrets management. It helps you centrally store, secure, and tightly control access to tokens, passwords, certificates, encryption keys, and other sensitive data.

### Why Integrate Vault with Terraform?
1. **Dynamic Secrets**: Generate credentials on the fly (e.g., temporary AWS IAM credentials valid for only 1 hour) instead of using long-lived static keys.
2. **Security**: Avoid hardcoding secrets/credentials in your `.tf` files or storing them plain-text in `.tfvars`.
3. **Automated Secret Rotation**: Vault handles rotating database passwords, SSH keys, etc., and Terraform can query Vault dynamically on every plan/apply.

### Simple Example: Fetching a Secret from Vault

To use Vault, configure the `vault` provider and use the `vault_generic_secret` data source to fetch credentials.

```hcl
provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = var.vault_token # Usually set via VAULT_TOKEN env var for security
}

# Fetch secret from path 'secret/data/db'
data "vault_generic_secret" "db_credentials" {
  path = "secret/db"
}

# Use the credentials in a resource
resource "aws_db_instance" "default" {
  allocated_storage = 20
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  username          = data.vault_generic_secret.db_credentials.data["username"]
  password          = data.vault_generic_secret.db_credentials.data["password"]
}
```

