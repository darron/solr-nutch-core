CORE_HOME="$( cd -P "$( dirname "$0" )" && pwd )"
CORE=${CORE_HOME##*/}

# Set environment variables
export JAVA_HOME=/usr/java/default
export NUTCH_CONF_DIR="$CORE_HOME/conf"

# Set arguments
THREADS=40  # determines the number of threads that will fetch in parallel
DEPTH=20    # indicates the link depth from the root page that should be crawled.
TOPN=5000   # determines the maximum number of pages that will be retrieved at each level up to the depth.

# Crawl the list of urls, and then let solr index
/opt/nutch/bin/crawl $CORE_HOME/conf/urls/seed.txt $CORE_HOME/crawl http://localhost:8085/solr/$CORE 2
