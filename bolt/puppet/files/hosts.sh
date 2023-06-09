if ! grep -q 'puppet' /etc/hosts; then
    echo '3.8.167.80 puppet' >> /etc/hosts
fi