FROM ubuntu:22.10

ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName

ADD content/* .
RUN bash ./init

WORKDIR $userHome
ONBUILD ADD ./build.bash /bin/build
ONBUILD RUN /usr/bin/bash -o errexit -o xtrace -o pipefail /bin/build