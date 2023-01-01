ARG image=ubuntu:22.10

FROM $image

ENV DEBIAN_FRONTEND noninteractive
ENV RUSTFLAGS '-C target-cpu=native -C opt-level=3 -C debuginfo=0 -C codegen-units=1'
# ENV CARGO_NET_GIT_FETCH_WITH_CLI true
ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName

RUN apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes update
RUN apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes upgrade
RUN apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install curl build-essential flex texinfo gettext automake pkg-config

WORKDIR /build
ADD bin/* /bin
RUN chmod ugo+x /bin/*
RUN ["/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "/bin/init.bash"]
ONBUILD ADD ./build*.bash /bin/
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build1.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build1.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build2.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build2.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build3.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build3.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build4.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build4.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build5.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build5.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build6.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build6.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build7.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build7.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build8.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build8.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build9.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build9.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build10.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build10.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build11.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build11.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build12.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build12.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build13.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build13.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build14.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build14.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build15.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build15.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f /bin/build16.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace /bin/build16.bash; fi"]
ONBUILD RUN ["/bin/bash", "-o", "errexit", "-o", "pipefail", "/bin/afterBuild.bash"]
ONBUILD RUN chown --recursive $userId:$groupId .