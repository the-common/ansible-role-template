# host variable file for example.com
#
# Copyright 2021 The Common Ansible Project Template Contributors <https://github.com/the-common/ansible-project-template/graphs/contributors>
# SPDX-License-Identifier: CC-BY-SA-4.0
---
api_server: api.example.com
database_server: db.example.com
