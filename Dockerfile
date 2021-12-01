FROM jenkins/jenkins

USER root

# Install tools required for compiling Python 3.6.1 and wget for installing pip3
RUN apt-get update -y && \
	apt-get upgrade -y

# RUN apt-get install -y \
# 	build-essential \
# 	libssl-dev \
# 	zlib1g-dev \
# 	libncurses5-dev \
# 	libncursesw5-dev \
# 	libreadline-dev \
# 	libsqlite3-dev \
# 	libgdbm-dev \
# 	libdb5.3-dev \
# 	libbz2-dev \
# 	libexpat1-dev \
# 	liblzma-dev \
# 	tk-dev \
# 	wget

# Install python3.6
RUN apt-get install -y python3-pip

# Install pip3 for Python 3.6
# RUN apt install python3-pip

# Install flask module
# RUN python3 -m pip install flask