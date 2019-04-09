# icinga2-rocketchat-notification
push icinga2 notifications to rocket.chat

![Rocket.Chat notification](https://github.com/jschanz/icinga2-rocketchat-notification/blob/master/images/rocketchat.png "rocket.chat notification")

!!! work in progress, but looks fancy enough at the moment !!!

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

## Configuration (Director)
### notification-rocketchat-host
```json
{
    "arguments": {
        "(no key)": {
            "command_id": "220",
            "skip_key": true,
            "value": "icinga2.localdomain.local",
            "order": "1"
        },
        "(no key.2)": {
            "command_id": "220",
            "skip_key": true,
            "value": "https:\/\/rocketchat.localdomain.local\/hooks\/deiquie5oabeiphazohph5Ae\/ooph0roo3foi6ceefie7ahthee3IejecheDe",
            "order": "2"
        },
        "(no key.3)": {
            "command_id": "220",
            "skip_key": true,
            "value": "$notification.type$",
            "order": "3"
        },
        "(no key.4)": {
            "command_id": "220",
            "skip_key": true,
            "value": "$host.name$",
            "order": "4"
        },
        "(no key.5)": {
            "command_id": "220",
            "skip_key": true,
            "value": "$host.state$",
            "order": "5"
        },
        "(no key.6)": {
            "command_id": "220",
            "skip_key": true,
            "value": "$host.display_name$",
            "order": "6"
        },
        "(no key.7)": {
            "command_id": "220",
            "skip_key": true,
            "value": "$notification.author$",
            "order": "7"
        },
        "(no key.8)": {
            "command_id": "220",
            "skip_key": true,
            "value": "$notification.comment$",
            "order": "8"
        },
        "(no key.9)": {
            "command_id": "220",
            "skip_key": true,
            "value": "$host.output$",
            "order": "9"
        }
    },
    "command": "\/etc\/icinga2\/scripts\/rocketchat-host-notification.sh",
    "disabled": false,
    "imports": [],
    "methods_execute": "PluginNotification",
    "object_name": "notification-rocketchat-host",
    "object_type": "object",
    "timeout": null,
    "vars": {},
    "zone": null
}
```
### notification-rocketchat-service
```json
{
    "arguments": {
        "(no key)": {
            "command_id": "221",
            "skip_key": true,
            "value": "icinga2.localdomain.local",
            "order": "1"
        },
        "(no key.10)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$notification.comment$",
            "order": "10"
        },
        "(no key.2)": {
            "command_id": "221",
            "skip_key": true,
            "value": "https:\/\/rocketchat.localdomain.local\/hooks\/deiquie5oabeiphazohph5Ae\/ooph0roo3foi6ceefie7ahthee3IejecheDe",
            "order": "2"
        },
        "(no key.3)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$notification.type$",
            "order": "3"
        },
        "(no key.4)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$host.name$",
            "order": "4"
        },
        "(no key.5)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$host.display_name$",
            "order": "5"
        },
        "(no key.6)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$service.display_name$",
            "order": "6"
        },
        "(no key.7)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$service.state$",
            "order": "7"
        },
        "(no key.8)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$service.output$",
            "order": "8"
        },
        "(no key.9)": {
            "command_id": "221",
            "skip_key": true,
            "value": "$notification.author$",
            "order": "9"
        }
    },
    "command": "\/etc\/icinga2\/scripts\/rocketchat-service-notification.sh",
    "disabled": false,
    "imports": [],
    "methods_execute": "PluginNotification",
    "object_name": "notification-rocketchat-service",
    "object_type": "object",
    "timeout": null,
    "vars": {},
    "zone": null
}
```
### host-by-rocketchat
```json
template Notification "host-by-rocketchat" {
    command = "notification-rocketchat-host"
    interval = 0s
}
```
### service-by-rocketchat
```json
template Notification "service-by-rocketchat" {
    command = "notification-rocketchat-service"
    interval = 0s
    users = [ "rocket.chat" ]
}
```

### "Host (DOWN) -> Rocket.Chat"
```json
apply Notification "Host (DOWN) -> Rocket.Chat" to Host {
    import "host-by-rocketchat"

    period = "24x7"
    assign where match("*", host.name)
    users = [ "rocket.chat" ]
}
```

### "Service (Problem) -> Rocket.Chat"
```json
apply Notification "Service (Problem) -> Rocket.Chat" to Service {
    import "service-by-rocketchat"

    period = "24x7"
    assign where match("*", host.name)
    users = [ "rocket.chat" ]
}
```


