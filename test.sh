#!/bin/bash
cd $(dirname $0)
puppet --modulepath $PWD/modules -v $PWD/site.pp
