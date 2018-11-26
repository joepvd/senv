# senv -- sensitive environment reporter

Ever afraid to run your local tests against the production database? `senv` has
you covered! When set up right, it will display an icon for each sensitive
variable that is made available to child programs. Variables that are not
`export`ed, are not reported.

## Installation
To make the `senv` function available in your shell, either source the file
`senv.zsh`, or copy its contents in `~/.zshrc`. That was the easy part.

You need to make functions available to the prompt. You can do that by
ensuring `set promptsubst` is executed.

Now possibly comes the tricky part: Locate where your prompt variable gets
defined. Drop the followinng tactically in the `PROMPT` or `PS1` variable:

```
$(senv)
```

An example:

![Image displaying](screenshot.png?raw=true "senv in action")

```sh
PROMPT='$(git_status)
$(senv)$reset_color%(?.%{$fg[green]%}.%{$fg[red]%})⫸ $reset_color '
```

Some of the icons used depend on FontAwesome4 being installed, as available in the
Ubuntu repositories.
