#!/bin/bash

echo "Configuracion de Firewalld"

echo "Restart dbus"
systemctl restart dbus
echo "Habilitar Firewalld"
systemctl enable firewalld
echo "Iniciar Firewalld"
systemctl start firewalld
echo "Estatus de Firewalld"
systemctl status firewalld

echo "Servicio de MySQL en Firewalld"
firewall-cmd --zone=public --add-service=mysql --permanent
echo "Puerto de MySQL en Firewalld"
firewall-cmd --zone=public --add-port=3306/tcp --permanent
echo "Puerto 4444 en Firewalld"
firewall-cmd --zone=public --add-port=4444/tcp --permanent
echo "Puerto de Comunicacion de Galera tipo TCP en Firewalld"
firewall-cmd --zone=public --add-port=4567/tcp --permanent
echo "Puerto 4568 funcional de Galera en Firewalld"
firewall-cmd --zone=public --add-port=4568/tcp --permanent
echo "Puerto de Comunicacion de Galera tipo UDP"
firewall-cmd --zone=public --add-port=4567/udp --permanent
echo "Reinicio de Firewalld"
firewall-cmd --reload

echo "Final de Script"