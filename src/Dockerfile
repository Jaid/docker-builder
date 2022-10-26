FROM ubuntu:22.10

ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName

WORKDIR /build
ADD bin/* /bin
RUN ["/usr/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "/bin/init.bash"]
ONBUILD ADD ./build*.bash /bin/
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build1.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build1.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build2.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build2.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build3.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build3.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build4.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build4.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build5.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build5.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build6.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build6.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build7.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build7.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build8.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build8.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build9.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build9.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build10.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build10.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build11.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build11.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build12.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build12.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build13.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build13.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build14.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build14.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build15.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build15.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-c", "if [[ -f /bin/build16.bash ]]; then /usr/bin/bash -o errexit -o pipefail -o xtrace /bin/build16.bash; fi"]
ONBUILD RUN ["/usr/bin/bash", "-o", "errexit", "-o", "pipefail", "/bin/afterBuild.bash"]
ONBUILD RUN chown --recursive $userId:$groupId .