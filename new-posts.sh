#!/bin/bash

read s Y m d H M S ms ns <<< "$(date +'%s %Y %m %d %H %M %S %3N %9N')"

hugo new "posts/${Y}-${m}-${d}_${H}-${M}-${S}/index.md"