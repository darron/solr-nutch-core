CORE_HOME="$( cd -P "$( dirname "$0" )" && pwd )"
CORE=${CORE_HOME##*/}

# Set environment variables
export JAVA_HOME=/usr/java/default
export NUTCH_CONF_DIR="$CORE_HOME/conf"

# Crawl the list of urls, and then let solr index
/opt/nutch/bin/crawl $CORE_HOME/conf/urls/seed.txt $CORE_HOME/crawl http://localhost:8085/solr/$CORE 5
