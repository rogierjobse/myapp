FROM rhscl/devtools-7-toolchain as build
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --install-options="--prefix=/install" -r /requirements.txt

FROM rhscl/python35-rhel7
COPY --from=build /install /usr/local
COPY src /app

WORKDIR /app


