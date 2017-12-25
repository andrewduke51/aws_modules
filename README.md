#### Using Terraform Format Hook
Run commands:
- `cp pre-commit-terraform-format.hook .git/hooks/pre-commit && chmod u+x .git/hooks/pre-commit`
- `chmod u+x .git/hooks/pre-commit`

Now, whenever you make changes to \*.tf files, terraform format will automatically format them for you upon commit.