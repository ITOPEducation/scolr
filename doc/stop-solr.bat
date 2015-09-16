set solr_install_dir=C:\ApiScol\solr-5.3.0
set solr_port=8983

echo "Launching Solr"
%solr_install_dir%\bin\solr stop -p %solr_port% 

@pause