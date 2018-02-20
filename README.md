# pulp-vagrant

## Set domain for VMs
```
export VAGRANT_DOMAIN=example.com
```

## Init all VMs
```
vagrant up
```

## Init just Pulp server VM
```
vagrant up pulp
vagrant ssh pulp
puppet apply /vagrant/pulp.pp -t
```

## Init node servers VM
> I call node as child of pulp server which sync content from pulp master

```
vagrant up <node1 or node2>
vagrant ssh <node1 or node2>
puppet apply /vagrant/pulp.pp -t
```

## Init just agent servers VM
> 
```
vagrant up <agent1 or agent2>
vagrant ssh <agent1 or agent2>
puppet apply /vagrant/consumer.pp -t
```
