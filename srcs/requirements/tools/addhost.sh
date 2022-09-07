grep "127.0.0.1 mmasubuc.42.fr" /etc/hosts

if [ $? != 0 ]; then
    echo "127.0.0.1 mmasubuc.42.fr" >> /etc/hosts
fi
