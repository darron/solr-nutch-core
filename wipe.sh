CORE_HOME="$( cd -P "$( dirname "$0" )" && pwd )"
CORE=${CORE_HOME##*/}
SOLR_SERVER="http://127.0.0.1:8085"

# Clear out a solr index.
curl "$SOLR_SERVER/solr/$CORE/update --data '<delete><query>*:*</query></delete>' -H 'Content-type:text/xml; charset=utf-8'"
curl "$SOLR_SERVER/solr/$CORE/update --data '<commit/>' -H 'Content-type:text/xml; charset=utf-8'"

curl "$SOLR_SERVER/solr/$CORE/update -H 'Content-type: text/xml' --data-binary '<optimize />'"

# Delete the files. Not needed anymore?
# rm -rf "$CORE_HOME/data/index"
# rm -rf "$CORE_HOME/crawl/crawldb"
# rm -rf "$CORE_HOME/crawl/linkdb"
# rm -rf "$CORE_HOME/crawl/segments"

# Reload just that core.
curl "$SOLR_SERVER/solr/admin/cores?action=RELOAD&core=$CORE"

echo "Search index deleted."