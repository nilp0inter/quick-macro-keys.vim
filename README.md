# QuickMacroKeys for Vim

QuickMacroKeys is a powerful Vim plugin designed to help you seamlessly
integrate macro keyboards with Vim. With this plugin, you can easily assign Vim
commands to specific macro keys on your macro pad. It offers a convenient and
efficient way to enhance your productivity and streamline your Vim workflow.

## How It Works

To use QuickMacroKeys, follow these simple steps:

1. Dedicate macro keys: Choose a number of keys on your macro pad to use with
   the plugin. For example, you can select 3 keys.
2. Set macro keys: Configure each dedicated macro key on your macro pad to send
   a specific sequence of characters when pressed. For example, you can set the
   keys to send <leader>m1, <leader>m2, and <leader>m3.
3. Configure the plugin: With QuickMacroKeys installed, press <leader> followed
   by the corresponding macro key in Vim's normal mode. You will be prompted to
   enter a Vim command that should be executed when that particular macro key
   is pressed.

The configuration is persistent and automatically aggregated along your path
hierarchy. This means that you can set different macro key configurations for
different projects or directories, and the plugin will intelligently apply the
appropriate configuration based on your current working directory.

## Example

Imagine you are working on a project with different macro key requirements for
its main directory and its documentation:

- In the main project directory, located at `/project`, you need macro key 1 to
  execute the command `:make test`, and macro key 2 to execute the command
  `:Gstatus`.

- To achieve this, while in the `/project` directory:
  - Press `<leader>` and *macro key 1* and `:make test<cr>` when prompted.
  - Press `<leader>` and *macro key 2* and `:Gstatus<cr>` when prompted.

- In the project's documentation directory, located at `/project/docs`, you want
  macro key 1 to execute the command `:make html`.

- To achieve this, while in the `/project/docs` directory:
  - Press `<leader>` and *macro key 1` and `:make html<cr>` when prompted.

When you start Vim in the `/project/docs` directory, QuickMacroKeys will apply
the aggregated mappings, resulting in the following configuration:

- Macro key 1: Executes command `:make html`
- Macro key 2: Executes command `:Gstatus`

QuickMacroKeys intelligently combines the macro key configurations based on
your current working directory, allowing you to have context-specific macro key
assignments for different parts of your project.
