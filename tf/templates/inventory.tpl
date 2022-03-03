%{ for index, ip in master_ip ~}
${master_name[index]} ansible_ssh_host=${master_ip[index]}
%{ endfor ~}
%{ for index, ip in worker_ip ~}
${worker_name[index]} ansible_ssh_host=${worker_ip[index]}
%{ endfor ~}

[master]
%{ for index, ip in master_ip ~}
${master_name[index]}
%{ endfor ~}

[node]
%{ for index, ip in worker_ip ~}
${worker_name[index]} 
%{ endfor ~}

[storage]


[vms]


[kube-cluster:children]
master
node