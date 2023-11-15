#!/bin/bash

touch .git/hooks/pre-push
chmod +x .git/hooks/pre-push

cat > .git/hooks/pre-push << "EOF"
#!/bin/bash
# Run markdownlint before pushing to origin
markdownlint '**/*.md' --ignore node_modules
# Exit with the exit status of RuboCop
exit $?
EOF
