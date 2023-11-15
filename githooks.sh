#!/bin/bash

touch .git/hooks/pre-push
chmod +x .git/hooks/pre-push

cat > .git/hooks/pre-push << "EOF"
#!/bin/bash
if ! git diff --exit-code >> /dev/null; then
    echo 'All changes must be added to the commit'
    git status
    exit 1
elif ! git diff --staged --exit-code >> /dev/null; then
    echo 'All changes must be added to the stage'
    git status
    exit 1
else
    # Run markdownlint before pushing to origin
    markdownlint '**/*.md' --ignore node_modules
    exit $?
fi
EOF
