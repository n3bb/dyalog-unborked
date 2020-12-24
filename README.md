# dyalog-unborked
run/install dyalog and the RIDE easily on debian-based distros

soon coming to redhat-based distros

## Installation
`git clone https://github.com/n3bb/dyalog-unborked/ && chmod u+x dyalog-unborked/dyalog-unborked.sh `

## Usage 
sudo ./dyalog-unborked.sh [subcommands] [sub-subcommands]

## Tutorial
edit the variables at the top of the shell script - paths should be absolute, and directory paths should end with a `/`. double check the URLs are ok too

then run `sudo ./dyalog-unborked.sh install deb` to install.

when you want to run dyalog with the RIDE, then do `./dyalog-unborked.sh run`

I reccomend aliasing `dyalog` to `./dyalog-unborked.sh run`, but this is optional

