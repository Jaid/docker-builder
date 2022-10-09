FROM ubuntu:22.10

ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName

RUN addgroup --system --gid $groupId $groupName
RUN adduser --disabled-password --gecos '' --uid $userId --ingroup $groupName --home $userHome --no-create-home --shell /bin/bash $userName
RUN mkdir --parents $userHome/bin
RUN chown --recursive $userId:$groupId $userHome
RUN DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes update
RUN DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install curl
RUN DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install build-essential

WORKDIR $userHome
ONBUILD ADD ./build.bash /bin/build
ONBUILD RUN /usr/bin/bash -o errexit -o xtrace -c /bin/build