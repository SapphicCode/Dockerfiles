#!/usr/bin/env bash
cd jenkins-python
docker build . -t pandentia/jenkins-python
docker push pandentia/jenkins-python
cd ..

cd
