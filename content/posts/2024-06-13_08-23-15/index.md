---
title: "hugo-extended + AsciiDoc + PlantUML + Docker"
date: 2024-06-13T08:23:15+09:00
---

hugoは公式のdockerイメージは存在しない

hugoのバイナリは
https://github.com/gohugoio/hugo/releases/
に存在するがhugo-extendedは無いので、自分でビルドする必要がある

asciidoctorはdockerイメージが存在するので利用する

asciidoctorはalpineイメージなので`CGO_ENABLED=0`でhugoをビルドできればベストだが、ビルドの依存関係上不可能だった

そこで`libc6-compat`を追加して対応した

```dockerfile Dockerfile
FROM golang as hugo-builder

RUN CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@v0.127.0

FROM asciidoctor/docker-asciidoctor

# libc6-compat is required for Hugo
RUN apk add --no-cache \
    libc6-compat \
    curl git make jq \
    ruby-dev alpine-sdk graphviz
RUN gem install bundler json asciidoctor-html5s asciidoctor-diagram

COPY --from=hugo-builder /go/bin/hugo /usr/bin/hugo

WORKDIR /src
RUN git config --global --add safe.directory /src

CMD /usr/bin/hugo server --bind=0.0.0.0
```

後は下記設定をconfig.yamlに追加する

```yaml config.yaml
markup:
  asciidocext:
    extensions:
      - asciidoctor-html5s
      - asciidoctor-diagram
    workingFolderCurrent: true
    trace: true
    attributes:
      my-base-url: 'https://example.com'

security:
  enableInlineShortcodes: false
  exec:
    allow:
      - '^(dart-)?sass(-embedded)?$'
      - '^go$'
      - '^npx$'
      - '^postcss$'
      - '^asciidoctor$'
    osEnv:
      - '(?i)^((HTTPS?|NO)_PROXY|PATH(EXT)?|APPDATA|TE?MP|TERM|GO\w+|(XDG_CONFIG_)?HOME|USERPROFILE|SSH_AUTH_SOCK|DISPLAY|LANG|SYSTEMDRIVE)$'
  funcs:
    getenv:
      - '^HUGO_'
      - '^CI$'
  http:
    methods:
      - '(?i)GET|POST'
    urls:
      - '.*'
```
