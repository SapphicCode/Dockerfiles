FROM pandentia/jenkins-python

USER root

RUN apt-get update
RUN apt-get install -y libffi-dev git
RUN pip3 install -U flake8 git+https://github.com/Rapptz/discord.py@rewrite
