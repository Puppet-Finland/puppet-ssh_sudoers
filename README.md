# ssh_sudoers

Puppet module for managing remote SSH access and sudo authorization rules.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with ssh_sudoers](#setup)
    * [What ssh_sudoers affects](#what-ssh_sudoers-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ssh_sudoers](#beginning-with-ssh_sudoers)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This Puppet module can be used to configure a "controller" node for running
commands on target hosts via SSH. The controller host, or rather the user it is
connecting as, can be granted limited privileges with help of sudo wrapper
scripts and corresponding sudo rules.

## Setup

### What ssh_sudoers affects

On controllers this module manages:

* Installing the private SSH key used to connect to target nodes

On target hosts the following things are managed:

* Adding the public SSH key to the authorized_keys file of the specified user
* Optional features
    * Add sudo rules and wrapper scripts to limit the privileges of the user on target servers

### Setup Requirements

Managing local system users is outside of the scope of this module. This is
because a suitable user may already exist, as in the case of Jenkins slave
process being responsible for running command via SSH.

### Beginning with ssh_sudoers

TODO

## Usage

TODO

## Limitations

There are a couple of limitations:

* Local system users are not managed on the controller or target nodes

## Development

Pull requests are welcome.
