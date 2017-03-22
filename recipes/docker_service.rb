service "ddclient" do
  start_command "/etc/init.d/ddclient start"
  stop_command "/etc/init.d/ddclient stop"
  restart_command "/etc/init.d/ddclient restart"
  status_command "/etc/init.d/ddclient status"
  action [:start]
end
