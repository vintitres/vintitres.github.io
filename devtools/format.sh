#!/bin/bash
# Auto-format all files in the repo

# Format templates with djLint
if python3 -m djlint --version &> /dev/null; then
    echo "Formatting Jinja templates with djLint..."
    python3 -m djlint --reformat templates/
else
    echo "Warning: djlint is not installed"
    echo "Install with: pip3 install djlint"
fi

# Format other files with Prettier
if command -v prettier &> /dev/null; then
    echo "Formatting other files with Prettier..."
    prettier --write . --config .prettierrc --ignore-path .prettierignore
else
    echo "Error: prettier is not installed globally"
    echo "Install with: npm install -g prettier"
    exit 1
fi

echo "✓ Formatting complete!"
