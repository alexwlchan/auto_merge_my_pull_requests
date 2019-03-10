FROM python:3-alpine

MAINTAINER Alex Chan <alex@alexwlchan.net>

LABEL "com.github.actions.name"="Auto-merge my pull requests"
LABEL "com.github.actions.description"="Merge and clean-up the pull request after the checks pass"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="green"

COPY requirements.txt /requirements.txt
RUN	pip3 install -r /requirements.txt

COPY merge_and_cleanup_branch.py /merge_and_cleanup_branch.py

ENTRYPOINT ["python3", "/merge_and_cleanup_branch.py"]
