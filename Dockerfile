FROM mcr.microsoft.com/windows/server
ARG INSTALL_JDK=false

# Download the latest self-hosted integration runtime installer into the SHIR folder
COPY SHIR C:/SHIR/

RUN ["powershell", "C:/SHIR/builds.ps1"]

ENTRYPOINT ["powershell", "C:/SHIR/setup.ps1"]

ENV SHIR_WINDOWS_CONTAINER_ENV True

HEALTHCHECK --start-period=120s CMD ["powershell", "C:/SHIR/health-check.ps1"]
