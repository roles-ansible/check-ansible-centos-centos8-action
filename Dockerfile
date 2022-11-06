# hadolint ignore=DL3007
FROM quay.io/centos/centos:stream8

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-centos-centos8-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-centos-centos8-action"

LABEL "com.github.actions.name"="check-ansible-centos-centos8"
LABEL "com.github.actions.description"="Check ansible role or playbook with CentOS centos8"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

# hadolint ignore=DL3041
RUN dnf update --assumeyes \
  && dnf install -y epel-release \
  && dnf install --assumeyes \
    ansible git \
  && dnf clean all \
  && ansible --version

COPY ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
