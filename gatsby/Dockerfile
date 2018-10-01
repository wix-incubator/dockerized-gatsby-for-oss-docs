FROM node:8.12.0-jessie

RUN apt-get update && \
    apt-get install -y \
	git \
	openssh-client \
	python \
	python-pip \
	python-dev \
	gettext-base && \
npm install --global gatsby-cli gh-pages

ENV TARGET_GIT_REPO_NAME=quix-docs-test
ENV TARGET_GIT_REPO_ORG=wix-incubator
ENV TEMPLATE_GIT_REPO=git@github.com:wix-incubator/oss-gatsby-v2-documentation-portal-draft.git
ENV DOC_FOLDER=doc
ENV TWITTER_ACCOUNT=svetlana_apr
ENV GITHUB_ACCOUNT=svitlanako

COPY ./run.sh /

EXPOSE 8000

ENTRYPOINT ["/run.sh"]