# [`rpm-ostree`](https://coreos.github.io/rpm-ostree/) module for startingpoint

The `rpm-ostree` module offers pseudo-declarative package and repository management using `rpm-ostree`.

The module first downloads the repository files from repositories declared under `repos:` into `/etc/yum.repos.d/`. The magic string `%OS_VERSION%` is substituted with the current VERSION_ID (major Fedora version), which can be used, for example, for pulling correct versions of repositories from [Fedora's Copr](https://copr.fedorainfracloud.org/).

Then the module installs the packages declared under `install:` using `rpm-ostree install`, and lastly, it removes the packages declared under `remove:` using `rpm-ostree override remove`.

Unfortunately, currently `rpm-ostree override remove`, and this module, might not be able to remove packages installed in image builds. Packages included by Fedora, such as Firefox can still be removed, though.

Example configuration:
```yml
type: rpm-ostree
repos: 
  - https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-%OS_VERSION%/atim-starship-fedora-%OS_VERSION%.repo
install:
  - python3-pip
  - libadwaita
remove:
  - firefox
  - firefox-langpacks
```