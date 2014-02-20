## kickstart-baseline
This is a rewrite of the Puppet recipes from [vagrant-baseline](https://github.com/bltavares/vagrant-baseline) to be used with [kickstart](https://github.com/bltavares/kickstart).
It uses some utilities from kickstart, and it is the only requirement that prevents those bash scripts from running standalone on any machine.

On `recipes` you will find scripts that are shared among some different roles, like compiler and libs packages and so on.
On `roles` you will find the scripts to setup the different environments that baseline provides.
On `files` is the files that will be copied and modified sometimes on the target.

### Current environments

| Name       | Provides                            | Extra information                         |
| ---        | ---                                 | ---                                       |
| redis      | from ppa:chris.lea                  | *port:* 6379                              |
| ruby       | chruby + ruby 2.0                   |                                           |
| ruby193    | chruby + ruby 1.9.3                 |                                           |

