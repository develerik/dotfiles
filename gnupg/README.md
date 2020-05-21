# GnuPG

## Table of Contents

1. [Features](#Features)
2. [Prerequisites](#Prerequisites)

## Features

- caches passphrase for 1 day
- uses tty pinentry
- allows unattended passphrase

## Prerequisites

This package assumes that you have installed the following tools:

- [gnupg](https://www.gnupg.org)
- [pinentry](https://gnupg.org/related_software/pinentry)

You also need to install the [sks ca certificate](https://sks-keyservers.net/sks-keyservers.netCA.pem) to
`/etc/ssl/certs/sks-keyservers.net_CA.pem`.
