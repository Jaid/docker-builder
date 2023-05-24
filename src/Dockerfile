ARG image=ubuntu:rolling

# FROM --platform=$BUILDPLATFORM ubuntu:rolling AS cargoFetch

# ENV userName app
# ENV groupName $userName
# ENV userId 1000
# ENV groupId $userId
# ENV userHome /$userName

# WORKDIR $userHome
# RUN DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --option APT::Get::Install-Recommends=false --option APT::Get::Install-Suggests=false --yes update
# RUN DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --option APT::Get::Install-Recommends=false --option APT::Get::Install-Suggests=false --yes install curl
# ADD bin/setupRust.bash /bin/setupRust
# RUN ["/bin/bash", "-o", "xtrace", "/bin/setupRust"]
# RUN mkdir project
# WORKDIR $userHome/project
# RUN PATH=$PATH:$HOME/.cargo/bin && export PATH && cargo init && cargo add itoa
# WORKDIR $userHome

# ENTRYPOINT [ "/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "-c" ]
# CMD [ "ls -l --all --time-style full-iso --block-size 1 \"$userHome\"" ]

FROM $image

ARG pythonPackageVersion=3
ENV pythonPackageVersion $pythonPackageVersion

ENV RUSTFLAGS '-C target-cpu=native -C opt-level=3 -C debuginfo=0 -C codegen-units=1'
ENV userName app
ENV groupName $userName
ENV userId 1000
ENV groupId $userId
ENV userHome /$userName

# COPY --from=cargoFetch /root/.cargo /root/.cargo

WORKDIR /build
ADD bin/initBuilder.bash /bin/initBuilder
RUN ["/bin/bash", "-o", "xtrace", "/bin/initBuilder"]
ADD userBin/* $userHome/userBin
ADD bin/registerUserBin.bash /bin/registerUserBin
RUN ["/bin/bash", "-o", "xtrace", "/bin/registerUserBin"]
ADD bin/installEssentials.bash /bin/installEssentials
RUN ["/bin/bash", "-o", "xtrace", "/bin/installEssentials"]
ADD bin/installPython.bash /bin/installPython
RUN ["/bin/bash", "-o", "xtrace", "/bin/installPython"]
ADD bin/setupRust.bash /bin/setupRust
RUN ["/bin/bash", "-o", "xtrace", "/bin/setupRust"]
ADD bin/setupBuilder.bash /bin/setupBuilder
RUN ["/bin/bash", "-o", "xtrace", "/bin/setupBuilder"]
ADD bin/afterBuild.bash /bin/afterBuild

ENTRYPOINT [ "/bin/bash", "-o", "errexit", "-o", "pipefail", "-o", "xtrace", "-c" ]
CMD [ "ls -l --all --time-style full-iso --block-size 1 / /root \"$userHome\"/*" ]

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
ONBUILD RUN chown --recursive $userId:$groupId .