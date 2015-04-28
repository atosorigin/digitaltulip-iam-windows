# digitaltulip-iam-windows
Builds and configures the windows aspects of the DigitalTulip proposition

Will create a windows domain based on the supplied environment variable. It will then promote to a domain controller and create a set of 5 users for test purposes.

Invoked in the following way

ansible-playbook -i plugins/inventory main.yml --extra-vars "env=dev"