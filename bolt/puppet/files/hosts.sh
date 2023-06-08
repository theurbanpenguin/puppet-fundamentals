if ! grep -q 'puppet' /etc/hosts; then
    echo '1.3.4.6 puppet' >> /etc/hosts
fi