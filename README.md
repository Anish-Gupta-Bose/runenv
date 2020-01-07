# Runenv
Docker Environment to run ansible, TF and packer

# Build

```
docker build -t runenv:latest .
```

# Run

```
alias runenv="docker run --rm --name ubuntu -it -v ~/workspace:/workspace -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws runenv:latest"
```

*Note -  replace workspace and ssh paths with the paths in your setup*

The entrypoint is the bash binary, it will drop the user into the containers bash shell. To run commands directly one can use the `-c` arg. A bash function to make this easier is in works.