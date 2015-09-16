set solr_install_dir=C:\ApiScol\solr-5.3.0
set solr_cores_dir=C:\ApiScol\solr
set solr_port=8983

echo "Launching Solr"
%solr_install_dir%\bin\solr start -p %solr_port% -s %solr_cores_dir% -Dsolr.install.dir=%solr_install_dir% 

@pause