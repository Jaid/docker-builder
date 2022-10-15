FROM ubuntu:22.10

ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName

WORKDIR /build
ADD bin/* /bin
RUN ["/usr/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "/bin/init.bash"]
ONBUILD ADD ./build.bash /bin/build.bash
ONBUILD RUN ["/usr/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "/bin/build.bash"]
ONBUILD RUN ["/usr/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "/bin/afterBuild.bash"]
ONBUILD RUN chown --recursive $userId:$groupId .