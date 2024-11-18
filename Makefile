SERVICE_NAME:=virsh-shutdown-vms

all:

install-service:
	rm -f /usr/local/bin/$(SERVICE_NAME).sh
	cp $(shell pwd)/$(SERVICE_NAME).sh /usr/local/bin
	cp -f ./$(SERVICE_NAME).service /etc/systemd/system/$(SERVICE_NAME).service
	systemctl daemon-reload
	systemctl enable $(SERVICE_NAME)

start:
	sudo systemctl start $(SERVICE_NAME)

status:
	sudo systemctl status $(SERVICE_NAME)
