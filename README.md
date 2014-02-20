## kickstart-baseline
This is a rewrite of the Puppet recipes from [vagrant-baseline](https://github.com/bltavares/vagrant-baseline) to be used with [kickstart](https://github.com/bltavares/kickstart).
It uses some utilities from kickstart, and it is the only requirement that prevents those bash scripts from running standalone on any machine.

On `recipes` you will find scripts that are shared among some different roles, like compiler and libs packages and so on.
On `roles` you will find the scripts to setup the different environments that baseline provides.
On `files` is the files that will be copied and modified sometimes on the target.

### Current environments

| Name       | Provides                            | Extra information                         |
| ---        | ---                                 | ---                                       |
| clojure    | lein latest stable version          | includes java role                        |
| docker     | latest from docker.io               |                                           |
| elixir     | 0.11.2                              | includes latest erlang                    |
| erlang     | latest from erlang-solutions.com    |                                           |
| go         | 1.2.0                               |                                           |
| gradle     | 1.9                                 | Includes java role                        |
| groovy     | 2.2.1                               | Includes java role                        |
| haskell    | haskell-platform from ubuntu's repo |                                           |
| io         | Latest io deb from io website       |                                           |
| java       | 7 + maven 3.1.1 + ant 1.9.3         |                                           |
| lua        | 5.2 + luarocks                      |                                           |
| mongo      | latest from 10\_gen repo            | *port:* 27017                             |
| nodejs     | latest from ppa:chris.lea           |                                           |
| postgresql | 9.3 + devel package                 | *username:* postgres *password:* postgres |
| prolog     | latest from ppa:swi-prolog/stable   |                                           |
| python     | 2.7 + pip and virtualenv            |                                           |
| rabbitmq   | latest from official apt repo       | *port:* 5672                              |
| racket     | 5.02 (January 2014)                 |                                           |
| redis      | from ppa:chris.lea                  | *port:* 6379                              |
| ruby       | chruby + ruby 2.0                   |                                           |
| ruby193    | chruby + ruby 1.9.3                 |                                           |
| rust       | 0.8                                 |                                           |
| scala      | 2.10.3 + sbt 0.13.0                 | Includes java role                        |
| sml        | smlnj 110.76                        |                                           |
| tools      | editors, version control, and others|                                           |
| zeromq     | 4.0.3                               |                                           |

