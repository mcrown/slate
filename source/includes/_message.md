# Message

## Receive

> Example Request

```shell
# Deliver all messages received by FracTEL phone number 3212524595
# to an email address email@domain.
$ curl --request POST
--url 'https://api.fractel.net/v2/message/receive'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"to": "3212524595", "type": "Email", "value": "email@domain.com"}'
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "SUCCESS"
}
```

Configure the delivery service type used as the destination for received messages.

### HTTP Request

Method | Route
--------- | -------
**POST** | `/message/receive`

### Body Parameters

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string |  | Your FracTEL phone number.
type | string | | Message service routing type. Allowed values are `None`, `Device`, `Email`, `URL` or `Forward`.
value | string | | Value of the chosen message routing type. Allows for a _Device ID_, _Email Address_, _URL_ or _Phone Number_ depending on the specified `type`.

## Receive Notify

> Example Request

```shell
# Configure FracTEL phone number 3212524595 to receive a callback with
# JSON payload data (application/json) to url https://hookb.in/vDkMOVB9
# when a message is received.
$ curl --request POST
--url 'https://api.fractel.net/v2/message/receive_notify'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"to": "3212524595", "method": "JSON", "url": "https%3A%2F%2Fhookb.in%2FvDkMOVB9"}'
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "SUCCESS"
}
```

Configure the callback URL to notify when a message is received. Each FracTEL phone number can be configured to use its own callback URL for handling receive notifications.

### HTTP Request

Method | Route
--------- | -------
**POST** | `/message/receive_notify`

### Body Parameters

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string |  | Your FracTEL phone number.
method | string | | Request method type to use when making the callback. Allowed values are `GET` _(querystring params)_, `POST` _(application/x-www-form-urlencoded)_ or `JSON` _(application/json)_.
url | string | | Valid HTTP or HTTPS URL that will accept callback data when a message is received by your FracTEL phone number.

### Callback Data

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string | | Phone number of recipient.
from | string | | Phone number of sender.
message | string | | Contents of the message.

<aside class="notice">
  Callback URLs configured to receive data using a <code>GET</code> request can use template string replacements to control which query string parameters receive callback data values. For example, the following query string maps each callback value to parameters in the query string: <code>recipient={{to}}&sender={{from}}&message={{msg}}</code>
</aside>

## Send

> Example Request

```shell
# Send an MMS message "Hello World"
# that does not require confirmation
# from FracTEL phone number 3212524595
# to a recipent 3211234567
# containing an image https://www.fractel.net/wp-content/uploads/2014/03/FracTEL_Tag_Logo.png
# with a callback url https://hookb.in/vDkMOVB9
$ curl --request POST
--url 'https://api.fractel.net/v2/message/send'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"to":"3211234567", "from": "3212524595", "message": "Hello%20World", "media_url": "https://www.fractel.net/wp-content/uploads/2014/03/FracTEL_Tag_Logo.png", "confirmation_url": "https%3A%2F%2Fhookb.in%2FvDkMOVB9", "require_confirmation": false}'
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "SUCCESS"
}
```

Send an SMS or MMS message to a recipient.

### HTTP Request

Method | Route
--------- | -------
**POST** | `/message/send`

### Body Parameters

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string |  | The recipient's 10 digit phone number.
from | string | | Your FracTEL phone number.
message | string | | Contents of the SMS or MMS.
media_url | string | | Valid HTTP or HTTPS URL for media to send via MMS. We allow up to 10 different URLs.
confirmation_url | string | | Valid HTTP or HTTPS URL that will accept callback data after the message is sent.
require_confirmation | string | | Only send message if confirmation is available.

## Send Notify

> Example Request

```shell
# Configure FracTEL phone number 3212524595 to receive a callback with
# POST data (application/x-www-form-urlencoded) to url https://hookb.in/vDkMOVB9
# when a message is sent.
curl --request POST
--url 'https://api.fractel.net/v2/message/send_notify'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"from":"3212524595", "method":"POST", "url": "https%3A%2F%2Fhookb.in%2FvDkMOVB9" }'
Request URL
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "SUCCESS"
}
```

Configure the callback URL to notify when a message is sent. Each FracTEL phone number can be configured to use its own callback URL for handling send notifications.

### HTTP Request

Method | Route
--------- | -------
**POST** | `/message/send_notify`

### Body Parameters

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
from | string |  | Your FracTEL phone number.
method | string | | Request method type to use when making the callback. Allowed values are `GET` _(querystring params)_, `POST` _(application/x-www-form-urlencoded)_ or `JSON` _(application/json)_.
url | string | | Valid HTTP or HTTPS URL that will accept callback data when a message is sent to your FracTEL phone number.

### Callback Data

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string | | Phone number of recipient.
from | string | | Phone number of sender.
message | string | | Contents of the message.

<aside class="notice">
  Callback URLs configured to receive data using a <code>GET</code> request can use template string replacements to control which query string parameters receive callback data values. For example, the following query string maps each callback value to parameters in the query string: <code>recipient={{to}}&sender={{from}}&message={{msg}}</code>
</aside>
