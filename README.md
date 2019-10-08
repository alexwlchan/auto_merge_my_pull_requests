# Auto merge my pull requests

A GitHub Action to automatically merge pull requests on my repositories if:

*   I opened the PR
*   The test suite is passing
*   I haven't marked the PR as a WIP

After the PR is merged, it deletes the branch to keep things neat and tidy.

![](screenshot.png)



## Motivation

I have a bunch of repos where I'm the only contributor, and I want to merge pull requests as soon as tests pass.
(The repo with [my blog](https://github.com/alexwlchan/alexwlchan.net), for example.)

This Action saves me the work of actually pushing the button, and means they get merged a little faster.

The Action is defined in a separate repo that doesn't have auto-merging pull requests so that somebody can't merge a PR with malicious code by editing the underlying Action.



## Usage

Fork this repo, add your own rules in `merge_and_cleanup_branch.py`.

Reference the Action in your workflow file:

```
name: Merge and cleanup

on: pull_request:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Merge and delete branch
      uses: yourname/auto_merge_my_pull_requests@development
      with:
        secrets: ${{ secrets.GITHUB_TOKEN }}
```

## Limitations

*   This will only merge pull requests which I opened.
    If you use this Action unmodified, you'll grant me magic PR-merging powers.

*   I'm only using this on repos that have a single test task.
    So it can handle this:

    ![](onetask.png)

    but it gets confused by this:

    ![](multitask.png)

    It will try to merge the pull request as soon as one of those checks completes.
    I only have a single task on each of my repos, so that's fine for me -- something like the `check_suite` trigger is probably more appropriate for larger builds.



## License

MIT.
