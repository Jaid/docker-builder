FROM ubuntu:22.10

ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName

WORKDIR $userHome
ADD content/* .
RUN bash -o errexit -o xtrace -o pipefail ./init
ONBUILD ADD ./build.bash /bin/build
ONBUILD RUN /usr/bin/bash -o errexit -o xtrace -o pipefail /bin/build