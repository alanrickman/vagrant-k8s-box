# vagrant-k8s-box

This box is intended for use with [vagrant-k8s](https://github.com/alanrickman/vagrant-k8s) which provides a local
k8s environment complete with master and multiple workers.

The initial version of [vagrant-k8s](https://github.com/alanrickman/vagrant-k8s) used a base Ubuntu image which
meant quite a lot of time was spent installing updates and dependencies when provisiong the Vagrant environment.

This box has all OS updates and dependencies installed as required to run the k8s cluster.

## Build Box

By default the Packer build will create a Vagrant box which is added locally and shipped to Vagrant Cloud.

Run Packer with the following command:

`packer build -var 'access_token=<vagrant cloud token>' -var 'version=<version>' vagrant-k8s-box.json`

## Build Local Box

To exclude the push to Vagrant Cloud and just build a local Vagrant box run:

`jq 'del(."post-processors"[] | .[] | select(.type=="vagrant-cloud"))' vagrant-k8s-box.json | packer build -force -var 'access_token=<vagrant cloud token>' -var 'version=<version>' -`

This uses jq to delete the 'vagrant-cloud' post processor from the Packer file before executing the build.
