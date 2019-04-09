# icinga2-rocketchat-notification
push icinga2 notifications to rocket.chat

## Installation
copy both notification scripts to /etc/icinga2/scripts or any other folder which is accessible by icinga2 user

## Configuration (Host)
- create a new host notification command
![Host Notification Command](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-host_1.png "create a new host notification command")

- add some arguments to the host notification command
![Arguments](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-host_2.png "add arguments")

- create a new notification template
![notification template](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-host_3.png "create a notification template")

- apply a notification rule
![apply notification rule](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-host_4.png "apply a notification rule")

## Configuration (Service)
- create a new service notification command
![Service Notification Command](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-service_1.png "create a new service notification command")

- add some arguments to the service notification command
![Arguments](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-service_2.png "add arguments")

- create a new notification template
![notification template](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-service_3.png "create a notification template")

- apply a notification rule
![apply notification rule](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/notification-rocketchat-service_4.png "apply a notification rule")

