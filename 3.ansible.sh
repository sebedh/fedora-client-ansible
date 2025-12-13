#!/bin/bash
source .venv/bin/activate
source .env

ansible-playbook -i inventory ssh-playbook.yaml \
    -e bootstrap_user_password=$BOOTSTRAP_USER_PASSWORD \
    -e bootstrap_user_password_enc=$BOOTSTRAP_USER_PASSWORD_ENC \
    -e bootstrap_root_password=$BOOTSTRAP_ROOT_PASSWORD \
    --diff "$@"
