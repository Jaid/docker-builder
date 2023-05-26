ARG image=ubuntu:rolling

FROM $image

SHELL [ "/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "-c" ]
ARG pythonPackageVersion=3
ENV pythonPackageVersion $pythonPackageVersion
ARG javaVersion=20
ENV javaVersion $javaVersion
ARG buildFolder=/build
ENV buildFolder $buildFolder
ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName
WORKDIR $buildFolder

ADD bin/initBuilder.bash /bin/initBuilder
RUN /bin/bash -o xtrace /bin/initBuilder
ADD userBin/* $userHome/userBin
ADD bin/registerUserBin.bash /bin/registerUserBin
ADD bin/installEssentials.bash /bin/installEssentials
ADD bin/installCTools.bash /bin/installCTools
ADD bin/installPython.bash /bin/installPython
ADD bin/installJava.bash /bin/installJava
ADD bin/setupRust.bash /bin/setupRust
ADD bin/setupBuilder.bash /bin/setupBuilder
ADD bin/afterBuild.bash /bin/afterBuild
RUN /bin/bash -o xtrace /bin/registerUserBin
RUN /bin/bash -o xtrace /bin/installEssentials
RUN /bin/bash -o xtrace /bin/installCTools
RUN /bin/bash -o xtrace /bin/installPython
RUN /bin/bash -o xtrace /bin/installJava
RUN /bin/bash -o xtrace /bin/setupRust
RUN /bin/bash -o xtrace /bin/setupBuilder

ENTRYPOINT [ "/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "-c" ]
CMD [ "ls -l --all --time-style full-iso --block-size 1 / /root \"$userHome\"/*" ]

ONBUILD WORKDIR $buildFolder
ONBUILD ADD ./build/build*.bash $userHome/bin
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build1.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build1.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build2.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build2.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build3.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build3.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build4.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build4.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build5.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build5.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build6.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build6.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build7.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build7.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build8.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build8.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build9.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build9.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build10.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build10.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build11.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build11.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build12.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build12.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build13.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build13.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build14.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build14.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build15.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build15.bash; fi"]
ONBUILD RUN ["/bin/bash", "-c", "if [[ -f $userHome/bin/build16.bash ]]; then /bin/bash -o errexit -o pipefail -o xtrace $userHome/bin/build16.bash; fi"]
ONBUILD RUN ["/bin/bash", "-o", "xtrace", "/bin/afterBuild"]
ONBUILD RUN chown --recursive $userId:$groupId $buildFolder $userHome