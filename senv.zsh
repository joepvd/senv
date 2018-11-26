setopt promptsubst

senv() {
  local that code leak reveals keys disclosure
  # Report the availability of exported environnment
  # variables of a sensitive nature in your prompt.
  # https://github.com/joepvd/senv
  typeset -aU reveals disclosure # Only report once
  typeset -A keys code
  keys=(
    AWS_ACCESS_KEY_ID     aws
    AWS_SECRET_ACCESS_KEY aws
    DNSIMPLE_TOKEN        dnsimple
    GH_TOKEN              github
    GITHUB_TOKEN          github
    HEROKU_API_KEY        heroku
    PG_DATABASE           psql
    PG_PASSWORD           psql
    SLACK_WEBHOOK         slack
    TRAVIS_TOKEN          travis
  )
  code=(
    aws        ⓐ
    github     
    psql       🐘
    slack      ⋕
    travis     👷
  )
  for leak that in ${(kv)keys}
    [[ ${(Pt)leak} =~ export ]] && reveals+=$that
  for leak in $reveals
    disclosure+="${code[$leak]-$leak}"
  [[ -z $disclosure ]] || print -n "${(j: :)disclosure} "
}
