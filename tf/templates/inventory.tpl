[master]
%{ for index, ip in master_ip ~}
${master_name[index]} ansible_host=${master_ip[index]}
%{ endfor ~}

[worker]
%{ for index, ip in worker_ip ~}
${worker_name[index]} ansible_host=${worker_ip[index]}
%{ endfor ~}