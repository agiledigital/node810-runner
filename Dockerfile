#
# Node JS 8.10 Runner Image
# Docker image with tools and scripts installed to support the running of a Node JS 8.10 app through its 'start' script
# Expects build artifacts (node_modules and dist directories) and package.json mounted at /home/runner/artifacts
#

FROM node:8.10.0-alpine
LABEL maintainer Agile Digital <info@agiledigital.com.au>
LABEL description="Docker image with libraries and tools as required to support the running of a Node JS 8.10 app" Vendor="Agile Digital" Version="0.1"

ENV HOME /home/runner
ENV RUNNER_USER runner
WORKDIR /home/runner

RUN adduser -S -u 10000 -h $HOME runner

# We need to support Openshift's random userid's
# Openshift leaves the group as root. Exploit this to ensure we can always write to them
# Ensure we are in the the passwd file
COPY app /home/runner/app
RUN chmod +x /home/runner/app/run.sh

RUN chmod g+w /etc/passwd
RUN chgrp -Rf root /home/runner && chmod -Rf g+w /home/runner

EXPOSE 3000

USER runner

ENTRYPOINT [ "/home/runner/app/run.sh" ]
