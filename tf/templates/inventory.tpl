[master]
%{ for index, ip in master_ip ~}
${ip} ansible_host=${master_ip[index]}
%{ endfor ~}

[worker]
%{ for index, ip in worker_ip ~}
${ip} ansible_host=${worker_ip[index]}
%{ endfor ~}