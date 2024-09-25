# roles

Define automation that can be reused in multiple [plays](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-Plays) and even shared for others to use on [Ansible Galaxy](https://galaxy.ansible.com/).

A role can define [variables](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-Vars-Variables) with defaults that can be overrided by the consumers to customize its behaviors.

## Creating the _namespace_._name_ pseudo-role

You can facilitate the reuse of the role playbooks by creating a self-referencing symbolic link via running the following commands after replacing the placeholder strings in the project directory in a text terminal:

```bash
ln_opts=(
    # Create symbolic link instead of hard link
    --symbolic

    # Use relative path as link destination to prevent broken links if the hosting project's path changes
    --relative

    # Overwrite existing links
    --force

    # Increase verbosity
    --verbose
)
ln "${ln_opts[@]}" . playbooks/roles/_namespace_._name_
```

## References

The following materials are referenced during the writing of this README:

* [Roles — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html)  
  Explains the basic information of Roles in Ansible.
* [Re-using Ansible artifacts — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse.html)  
  Explains how to reuse Ansible artifacts in general.
* [Roles — Glossary — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-Roles)  
  Explains the usage of the "role" Ansible term.
