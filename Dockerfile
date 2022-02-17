FROM ibmcom/ace-server:11.0.0.11-r2-20210303-133203-amd64
 
USER root
 
COPY Bars /home/aceuser/bars
COPY propertyFile.properties /home/aceuser/initial-config/bar_overrides
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
RUN ace_compile_bars.sh 
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
RUN ace_config_bar_overrides.sh
USER root
 
RUN  chmod -R ugo+rwx /home/aceuser
 
USER 1000
