# Description

Checks for user defined phrases that you don't want to commit to your
repository, such as `var_dump()`, `console.log()` etc. on `pre-commit`.

This can be overridden by using the following option :

```sh
git commit --no-verify
```

This hook is language-agnostic.

You must configure the `commitregex` option for this hook . The value is the
name of a file that contains one forbidden phrase per line. There is a sample,
you can use it like this :

    git config [--global] hooks.jira.commitregex "^(DEV-[0-9]+|merge)"

# Activation

```sh
git config --add hooks.enabled-plugins jira
```
