#! /usr/bin/env bash

#codename=$(sudo cat /etc/lsb-release|grep DISTRIB_CODENAME | sed s/DISTRIB_CODENAME=//)
codename=$(lsb_release -cs)

echo "deb https://packages.erlang-solutions.com/ubuntu $codename contrib" | sudo tee /etc/apt/sources.list.d/erlang.list > /dev/null
sudo apt install gnupg-curl

sudo apt-key adv --fetch https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
sudo apt update
sudo apt install erlang erlang-doc erlang-manpages


