---
title: "毎日の記録を実践するための便利なスクリプト"
date: 2020-09-01T09:17:58+09:00
---

毎日こまめに行動の記録を取るのは良いらしい

https://docs.google.com/presentation/d/1WYo14faJY9LVSAazTT3_FCoCYv48JODZlZO7rppuZPQ/mobilepresent#slide=id.g89fd1a9fd7_2_316

そこで、以下のスクリプトを書いた

```sh
#!/bin/bash
echo "\n# $(date '+%H:%M')\n" >> "$(date '+%Y-%m-%d').md"
```

これで記録がはかどる
