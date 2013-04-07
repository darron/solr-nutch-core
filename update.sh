CORE_HOME="$( cd -P "$( dirname "$0" )" && pwd )"
CORE=${CORE_HOME##*/}
JETTY_USER="jetty"
JETTY_PORT="8085"

# Set environment variables
export JAVA_HOME=/usr/java/default
export NUTCH_CONF_DIR="$CORE_HOME/conf"

# Crawl the list of urls, and then let solr index
/opt/nutch/bin/crawl $CORE_HOME/conf/urls/seed.txt $CORE_HOME/crawl http://localhost:$JETTY_PORT/solr/$CORE 5

chown -R $JETTY_USER.$JETTY_USER $CORE_HOME