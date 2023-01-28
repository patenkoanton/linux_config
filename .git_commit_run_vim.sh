# This is a redirect script to run vim with ~/myvimrc during git commit execution.

#!/bin/bash

exec vim -c "so ~/myvimrc" "$@"
