## kickstart-baseline
Bash installation script for developer environments

This is a rewrite of the Puppet recipes from [vagrant-baseline](https://github.com/bltavares/vagrant-baseline) to be used with [kickstart](https://github.com/bltavares/kickstart).
It uses some utilities from kickstart, and it is the only requirement that prevents those bash scripts from running standalone on any machine.

On `recipes` you will find scripts that are shared among some different roles, like compiler and libs packages and so on.
On `roles` you will find the scripts to setup the different environments that baseline provides.
On `files` is the files that will be copied and modified sometimes on the target.

### Requirements

 * [kickstart](https://github.com/bltavares/kickstart)

### Instalation and usage

```bash
git clone https://github.com/bltavares/kickstart-baseline.git
cd kickstart-baseline

# Point to a machine
kickstart deploy "-p 2222 root@docker" nodejs

# Or deploy locally
kickstart local nodejs
```

### Current environments

| Name       | Provides                             | Works on Mac | Extra information                         |
| ---        | ---                                  | ---          | ---                                       |
| clojure    | lein latest stable version           | ✓            | includes java role                        |
| docker     | latest from docker.io                | x            |                                           |
| elixir     | 0.11.2                               | ✓            | includes latest erlang                    |
| erlang     | latest from erlang-solutions.com     | ✓            |                                           |
| go         | 1.2.0                                | ✓            |                                           |
| gradle     | 1.9                                  | ✓            | Includes java role                        |
| groovy     | 2.2.1                                | ✓            | Includes java role                        |
| haskell    | haskell-platform from ubuntu's repo  | ✓            |                                           |
| io         | Latest io deb from io website        | ✓            |                                           |
| java       | 7 + maven 3.1.1 + ant 1.9.3          | ✓            |                                           |
| lua        | 5.2 + luarocks                       | ✓            |                                           |
| mongo      | latest from 10\_gen repo             | ✓            | *port:* 27017                             |
| nodejs     | latest from ppa:chris.lea            | ✓            |                                           |
| postgresql | 9.3 + devel package                  | ✓            | *username:* postgres *password:* postgres |
| prolog     | latest from ppa:swi-prolog/stable    | ✓            |                                           |
| python     | 2.7 + pip and virtualenv             | ✓            |                                           |
| rabbitmq   | latest from official apt repo        | ✓            | *port:* 5672                              |
| racket     | 5.02 (January 2014)                  | ✓            |                                           |
| redis      | from ppa:chris.lea                   | ✓            | *port:* 6379                              |
| ruby       | chruby + ruby 2.0                    | ✓            |                                           |
| ruby193    | chruby + ruby 1.9.3                  | ✓            |                                           |
| rust       | 0.8                                  | ✓            |                                           |
| scala      | 2.10.3 + sbt 0.13.0                  | ✓            | Includes java role                        |
| sml        | smlnj 110.76                         | ✓            |                                           |
| tools      | editors, version control, and others | ✓            |                                           |
| zeromq     | 4.0.3                                | ✓            |                                           |

### About Mac setup
The environments are basically using the homebrew versions provided.

### Tested on:

* Ubuntu
* Docker
* Mac

### Caveates

* vagrant role should be passed before docker to put vagrant user into docker group.

### Example outputs

```bash
$ kickstart local nodejs
Setting up Mac
Mac >> Running "brew update -y"
Mac >> Running "brew upgrade -y"
Mac >> brew command outputs will be suppressed. Check "brew info <package_name>" for caveats
Setting up nodejs
nodejs >> nodejs already installed
Done
```

```bash
vagrant@nodejs:/opt/kickstart-baseline$ kickstart docker-create
[......]
For deploy: kickstart deploy "-p 2344 root@localhost" [roles]
vagrant@nodejs:/opt/kickstart-baseline$ kickstart deploy "-p 2344 root@localhost" nodejs
Setting up Ubuntu
Ubuntu >> Running "apt-get update -y"
Ubuntu >> Running "apt-get upgrade -y"
Ubuntu >> software-properties-common python-software-properties already installed
Ubuntu >> Check for presence of universe or add it
Ubuntu >> Running "apt-get update -y"
Ubuntu >> Running "apt-get upgrade -y"
Setting up nodejs
nodejs >> Running "add-apt-repository -y ppa:chris-lea/node.js"
nodejs >> Running "apt-get update -y"
nodejs >> nodejs already installed
Done
```

### Debug
To debug, prepend the command with DEBUG=1


```bash
DEBUG=1 kickstart local nodejs
```
