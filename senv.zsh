emulate -L zsh

local senv_problem varname provider out
typeset -aU senv_problem

# Setting defaults unless overridden
[[ -z $senv_keys ]] && {
  typeset -A senv_keys
  senv_keys=(
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
}
[[ -z $senv_display ]] && {
  typeset -A senv_display
  senv_display=(
    aws        
    github     
    psql       🐘
    slack      
    travis     👷
  )
}

for varname provider in ${(kv)senv_keys}
  [[ ${(Pt)varname} =~ export ]] && senv_problem+=$provider
for provider in $senv_problem
  out+=$(
    [[ $+senv_display[$provider] ]] \
      && print -n $senv_display[$provider] \
      || print -n $provider
  )
print -n $out
