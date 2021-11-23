#!/usr/bin/env bash
## Check if gogroup is installed
if ! tool_loc="$(type -p gogroup)" || [[ -z ${tool_loc} ]]; then
      echo "gogroup is not installed. installing...."
      go get -u -v github.com/Bubblyworld/gogroup/...
fi

gogroup -order std,other,prefix=Finndon_Auth_app --rewrite $(find . -type f -name "*.go" | grep -v /vendor/ |grep -v /.git/)