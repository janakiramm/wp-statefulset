# SSH into each node and run the this to mount NFS share
sudo -i
systemctl start rpcbind nfs-mountd
systemctl enable rpcbind nfs-mountd
echo "10.245.1.2:/opt/data  /mnt/data  nfs      rw,sync,hard,intr  0    0" >> /etc/fstab
dnf -y install autofs
echo "/-    /etc/auto.mount" >> /etc/auto.master
echo "/mnt/data -fstype=nfs,rw  10.245.1.2:/opt/data" >> /etc/auto.mount
systemctl start autofs
systemctl enable autofs
