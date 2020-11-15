unset SSH_AUTH_SOCK
lein run test --username admin --nodes-file  ./nodes  --ssh-private-key ~/.ssh/id_rsa $@
