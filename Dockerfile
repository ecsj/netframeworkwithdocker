# Full List here:
# mcr.microsoft.com/windows
# IoT: docker pull mcr.microsoft.com/windows/iotcore
# Nano: docker pull mcr.microsoft.com/windows/nanoserver:1903
# Nano IIS: docker pull nanoserver/iis
# Nano for Windows 2019: docker pull mcr.microsoft.com/windows/nanoserver:1809
# Core: docker pull mcr.microsoft.com/windows/servercore:ltsc2019
# Core IIS: docker pull mcr.microsoft.com/windows/servercore/iis
# Inside: docker pull mcr.microsoft.com/windows/servercore/insider:10.0.20303.1
# Basic IIS: docker pull microsoft/iis

FROM mcr.microsoft.com/windows/servercore/iis

# Install IIS and copy the files
SHELL ["powershell"]

RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
    Install-WindowsFeature Web-Asp-Net45

RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
WORKDIR /inetpub/wwwroot
COPY . .

#CMD [ "cmd" ]

# Run it as
# docker run -d -p 8082:80 --name demoiis demoiis
