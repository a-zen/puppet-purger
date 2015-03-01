# puppet-purger
Delete old reports from puppet master

# Description
This script deletes puppet reports file which are older than the
given number of days. The newest report will always be not deleted,
even if it's older than the given number of days.
The script is intended to run on the puppet master, where the reports are
saved.

# Dependencies 
Only sh or bash and typical system utils (find,sort,tail,xargs) are
required.

# Requirements
This script should be run as root or a user which can deleted the puppet
reports.

# Installation
Simply copy the file to a path which suites you (e.g. /usr/local/bin),
change ownership and permissions accordingly.

```
cp puppet-purger.sh /usr/local/bin
chown root:root /usr/local/bin/puppet-purger.sh
chmod 755 /usr/local/bin/puppet-purger.sh
```

# Usage

## Help

```
This script deletes puppet reports file which are older than the
given number of days. The newest report will always be not deleted,
even if it's older than the given number of days.
The script is intended to run on the puppet master, where the reports are
saved.

Usage: puppet-purger [-h] [-v] [-q] [-s] [-d report directory]
                   [ -n file age in days]

Options:
-h Print this help message
-v Print script version
-d Sets directory where the reports are (default: /var/lib/puppet/reports)
-n delete reports older than number of days (default: 30)
-s enables simulating mode where not files are deleted
-q enables quiet mode where no unnecessary output is made
```

## Example

```
/usr/local/bin/puppet-purger.sh
```

Most likely you want to use this script within a cron job.

```
# delete old puppet reports every sunday at 3:00
0 3 * * 0 /usr/local/bin/puppet-purger.sh
```

# License
GPLv2, see LICENSE file
