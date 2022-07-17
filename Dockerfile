ARG arch
FROM rockywei/swift:5.6.$arch
RUN apt-get update -y
RUN apt-get install -y mysql-client pkg-config libmysqlclient-dev
