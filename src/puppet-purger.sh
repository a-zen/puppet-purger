
# actual deletes old reports
# orginal code from https://groups.google.com/d/msg/puppet-users/q8vWDr3bn4Q/nsjpAHPsvrEJ
purgeReports()
{
  for node in `find ${reportDir} -mindepth 1 -maxdepth 1 -type d`
  do
    find $node -type f -name \*.yaml -mtime $days |
    sort -r |
    tail -n +2 |
    xargs -n50 /bin/rm -f
  done
}

