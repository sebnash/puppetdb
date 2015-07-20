FROM sebnash/puppetdb-setup
MAINTAINER Sebastian Nash <mail@sebnash.com>

# Override at runtime
ENV PUPPETSERVER puppet.example.com

# Use Puppet to install PuppetDB
RUN /opt/puppetlabs/bin/puppet resource package puppetdb ensure=latest

# Configure PuppetDB connection to PostgreSQL
ADD puppetdb_config.sh /tmp/
RUN /tmp/puppetdb_config.sh

EXPOSE 8080 8081
ENTRYPOINT [ "/opt/puppetlabs/bin/puppetdb", "foreground" ]
