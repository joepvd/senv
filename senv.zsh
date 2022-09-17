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
    DATABASE_URL          db
    DB                    db
    DB_SERVER             db
    GH_TOKEN              github
    GITHUB_TOKEN          github
    HEROKU_API_KEY        heroku
    JIRA_TOKEN            jira
    JIRA_API_TOKEN        jira
    MYSQL_URL             mysql
    MYSQL_PASSWORD        mysql
    PG_DATABASE           psql
    PG_PASSWORD           psql
    REDIS_URL             redis
    SLACK_WEBHOOK         slack
    TRAVIS_TOKEN          travis
  )
  code=(
    aws       
    db       	⛁
    github    
    heroku    ⓗ
    mysql    	🐬
    psql      🐘
    redis    	⌬
    slack     
    travis    👷
    jira      
  )
  for leak that in ${(kv)keys}
    [[ ${(Pt)leak} =~ export ]] && reveals+=$that
  for leak in $reveals
    disclosure+="${code[$leak]-$leak}"
  [[ -z $disclosure ]] || print -n "${(j: :)disclosure} "
}
