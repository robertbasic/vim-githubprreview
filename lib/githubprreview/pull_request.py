import os
import json
import requests
import vim

import patch

def start_review(owner, repo, pr):
    authfile = os.path.expanduser('~/.vim-github-pr-review-auth')
    github_user, github_token = open(authfile).read().strip().split(":")

    owner = vim.eval("a:owner")
    repo = vim.eval("a:repo")
    pr = vim.eval("a:pr")

    patchfile = download(owner, repo, pr, github_user, github_token)

    review_patch(patchfile)

def download(owner, repo, pr, github_user, github_token):
    headers = {'Accept': 'application/vnd.github.v3.patch'}
    url = 'https://api.github.com/repos/%s/%s/pulls/%s.patch' % (owner, repo, pr)
    r = requests.get(url, headers=headers, auth=(github_user, github_token))

    patchfile = '/tmp/%s-%s-%s.patch' % (owner, repo, pr)
    f = open(patchfile, 'w')
    f.write(r.text)
    f.close()

    return patchfile

def review_patch(patchfile)
    vim.command("PatchReview %s" % (patchfile))
    vim.command("file Overview")
