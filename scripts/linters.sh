#!/usr/bin/env bash
echo "golang-ci lint..."
golangci-lint run ./...

echo "gogroup..."
gogroup -order std,other,prefix=git-codecommit.eu-west-2.amazonaws.com/v1/repos/Finndon_Auth_app  $(find . -type f -name "*.go" | grep -v "vendor/")