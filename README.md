# A set of useful git hooks

These hooks automate some tasks with the help of git.
For the moment, it is mostly hooks related to tools from the php ecosystem.

## Installation

    git clone https://github.com/jdahern/git_template ~/.git_template

### Configuration

Set the newly cloned repo as your git template directory. This will tell git to
populate new repositories created with either `git clone` or `git init` with
the content of this directory. By default, it uses `/usr/share/git-core/templates`.

    git config --global init.templatedir '~/.git_template/template'

### Updating

To get updates you need to update your template directory first :

```sh
# Go to your template directory (probably ~/.git_template/template)
cd $(git config --path --get init.templatedir)
git pull
```

Then, you can update any repository by running `git init` from within it.
Don't fear, [it is perfectly safe][init-manpage].

### Setup on existing projects

You can also run the update script from a project created before your switch
to `git_template`, but be aware that any hook you created yourself will be deleted.

## Usage

Just run the configuration script. From your repository root, run

    .git/configure.sh

The script will help you configure some scripts that shouldn't be configured globally.

### Manual configuration

By default, no hook will run. You must configure the hooks you need:

```sh
git config hooks.enabled-plugins php/composer
git config --add hooks.enabled-plugins php/ctags
git config --add hooks.enabled-plugins junkchecker
```

The `--add` flag is necessary if you don't want to wipe out previously added
plugins.

If you want to enable a plugin on every project, use the `--global` option:

```sh
git config --global --add hooks.enabled-plugins some_plugin
```


[0]: https://github.com/greg0ire/git_template
[init-manpage]: https://git-scm.com/docs/git-init


