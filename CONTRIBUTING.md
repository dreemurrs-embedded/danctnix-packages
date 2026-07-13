## Code Guidelines

PKGBUILD contributions should follow [Arch Linux's package guidelines](https://wiki.archlinux.org/title/Arch_package_guidelines)

Each package is a commit, if one package contains multiple commits then please squash them.

If the package is forked from upstream Arch Linux/Arch Linux ARM, describe what changes are made to the package and why is it made.

Before submitting a pull request, make sure that your PKGBUILD compiles on a clean Arch Linux ARM (aarch64) root system and tested on the device/an aarch64 system.

## Commit Message Guidelines

Here is a sample commit message for a package change:

```
pkg: pine64: linux-pine64: upgrade to 5.14.9
```

 * If applicable, prefix the first line with a tag indicating the relevant area of changes:
   * `pkg:`
     * followed by which repository and package the change was made to
   * `misc:`
   * `qc:`
   * `github:`
 * Write detailed info on following lines when applicable

## “AI”-assisted contributions
**Using pre-existing *boilerplate*, *snippets*, or *syntax suggestions* from your IDE are not considered as “AI”-assisted changes.**

Contributions written largely with help of LLMs (_Large Language Models_), other “AI” (or non-“AI”), or similar systems are not welcome.

Using the output of “AI” as part of your interactions such as issues, pull requests or comments is not welcome.
