# Message

## Send

> Example Request

```shell
# Send an MMS message "Hello World"
# that does not require confirmation
# from FracTEL phone number 3211234566
# to a recipent 3211234567
# containing an image https://www.fractel.net/wp-content/uploads/2014/03/FracTEL_Tag_Logo.png
# with a callback url https://hookb.in/vDkMOVB9
$ curl --request POST
--url 'https://api.fractel.net/v2/message/send'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"to":"3211234567", "from": "3211234566", "message": "Hello%20World", "media_url": "https://www.fractel.net/wp-content/uploads/2014/03/FracTEL_Tag_Logo.png", "confirmation_url": "https%3A%2F%2Fhookb.in%2FvDkMOVB9", "require_confirmation": false}'
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "SUCCESS",
  "uid": "574330d1cdd7e1566b61b771ac72295f"
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
from | string | | Your 10 digit FracTEL &reg; phone number.
message | string | | Contents of the SMS or MMS.
media_url<br/>_optional_ | array[string] | | Valid HTTP or HTTPS URL(s) for media to send via MMS. See **Notes** for additional information.
confirmation_url<br/>_optional_ | string | | Valid HTTP or HTTPS URL that will accept callback data after the message is sent. See **Notes** for additional information.
require_confirmation<br/>_optional_ | string | | Only send message if confirmation is available. See **Notes** for additional information.

<aside class="notice">
Networks impose a limit of one message per second per sending (`from`) phone number. Calls that exceed this rate limit will receive an error code of `400 - Rate Limit Exceeded`.
</aside>

### Notes

#### `media_url`

Binaries, as identified by `media_url`, have a size limit of 1.5MB.

Multiple entries for `media_url`, with a limit of 10 per message, are supported. If a single URL is being sent, it must be sent as a single-element array.

**Supported MMS File Types**

Extension | File Type | - | Extension | File Type | - | Extension | File Type | - | Extension | File Type
--------- | --------- | - | --------- | --------- | - | --------- | --------- | - | --------- | ---------
.gz | application/gzip | | .flac | audio/flac | | .jpg | image/jpeg | | .avi | video/avi
.js | application/javascript | | .m4a | audio/mp4 | | .pjpeg | image/pjpeg | | .m4v | video/mp4
.json | application/json | | .m4b | audio/mp4 | | .png | image/png | | .mp4 | video/mp4
.oga | application/ogg | | .m4p | audio/mp4 | | .svg | image/svg+xml | | .m1v | video/mpeg
.ogg | application/ogg | | .m4r | audio/mp4 | | .tif | image/tiff | | .mpeg | video/mpeg
.ogv | application/ogg | | .m1a | audio/mpeg | | .tiff | image/tiff | | .mpg | video/mpeg
.ogx | application/ogg | | .m2a | audio/mpeg | | .webp | image/webp | | .mpv | video/mpeg
.pdf | application/pdf | | .mp1 | audio/mpeg | | .ico | image/x-icon | | .ogg | video/ogg
.rtf | application/rtf | | .mp2 | audio/mpeg | | .cal | text/calendar | | .ogm | video/ogg
.smil | application/smil | | .mp3 | audio/mpeg | | .css | text/css | | .ogv | video/ogg
.bz2 | application/x-bzip2 | | .mpa | audio/mpeg | | .csv | text/csv | | .ogx | video/ogg
.gz | application/x-gzip | | .oga | audio/ogg | | .html | text/html | | .spx | video/ogg
.tar | application/x-tar | | .wav | audio/wav | | .js | text/javascript | | .mov | video/quicktime
.xml | application/xml | | .webm | audio/webm | | .txt | text/plain | | .qt | video/quicktime
.zip | application/zip | | .bmp | image/bmp | | .vcard | text/vcard | | .webm | video/webm
.3gp | audio/3gpp | | .dib | image/bmp | | .vcf | text/vcard | | .flv | video/x-flv
.3ga | audio/amr | | .gif | image/gif | | .wap | text/vnd.wap.wml | | .wmv | video/x-ms-wmv
.amr | audio/amr | | .jpeg | image/jpeg | | .xml | text/xml

Up to ten URLs can be accepted per message.

#### `confirmation_url`

Message sending confirmation callback URLs receive JSON data via a <code>POST</code> request (see below for a description of the data package) but can also use token replacements to receive callback data values in query string parameters. For example, the following partial query string maps each callback data value to parameters in the query string: <code>recipient={{to}}&sender={{from}}&message={{msg}}&code={{dc}}&state={{ds}}</code>

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string | | Phone number of recipient.
from | string | | Phone number of sender.
message | string | | Contents of the message.
deliverystate | string | | Delivery state of the message. Potential values are `waiting`, `delivered` or  `not-delivered`.
deliverycode | int | | Delivery code of the message. Potential values are: <ul><li>`000` - Message delivered to carrier</li><li>`100` - Message not delivered to carrier</li><li>`187` - Statistical spam detected</li><li>`188` - Keyword spam detected</li><li>`189` - Spam detected</li><li>`482` - Loop detected</li><li>`600` - Destination carrier could not accept messages</li><li>`610` - Message submission failed</li><li>`620` - Destination application error</li><li>`630` - Message not acknowledged</li><li>`720` - Invalid destination number</li><li>`740` - Invalid source number</li><li>`999` - Unknown error</li></ul>

#### `require_confirmation`

If this is set to `false`, and a message cannot be delivered with a confirmation option, the API will send the message anyway. This is the default behavior if this parameter is omitted.

If this is set to `true`, and a message cannot be delivered with a confirmation option, the API will return an error and the message will NOT be sent.

## Send Notify

> Example Request

```shell
# Configure FracTEL phone number 3211234567 to receive a callback with
# POST data (application/x-www-form-urlencoded) to url https://hookb.in/vDkMOVB9
# when a message is sent.
curl --request POST
--url 'https://api.fractel.net/v2/message/send_notify'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"from":"3211234567", "method":"POST", "url": "https%3A%2F%2Fhookb.in%2FvDkMOVB9" }'
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "SUCCESS"
}
```

Configure the callback URL to notify when a message is sent. Each FracTEL &reg; phone number can be configured to use its own callback URL for handling send notifications.

### HTTP Request

Method | Route
--------- | -------
**POST** | `/message/send_notify`

### Body Parameters

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
from | string |  | Your FracTEL &reg; phone number.
url | string | | Callback URL. See **Notes** for additional information.
method | string | | Allowed values are `GET`,`POST`, or `JSON`. See **Notes** for additional information.

### Notes

#### `url`

This is a valid HTTP or HTTPS URL that will accept callback data when a message is sent from the FracTEL &reg; phone number specified in `from`.

#### `method`

One of three available methods must be specified for the callback execution.
- `GET` returns data through query string parameters on a `GET` to the given URL.
- `POST` returns data as _(application/x-www-form-urlencoded)_ in the body of a `POST` to the given URL.
- `JSON` returns data as _(application/json)_ in the body of a `POST` to the given URL.

#### Callback Data

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string | | Phone number of recipient.
from | string | | Phone number of sender.
message | string | | Contents of the message.
uid | string | | Unique identifier for the message.

Callback URLs using the `GET` method use token replacements to place callback data values in query string parameters. For example, the following partial query string maps each callback data value to parameters in the query string: <code>recipient={{to}}&sender={{from}}&message={{msg}}&id={{uid}}</code>

## Receive

> Example Request

```shell
# Deliver all messages received by FracTEL phone number 3211234567
# to an email address email@domain.
$ curl --request POST
--url 'https://api.fractel.net/v2/message/receive'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"to": "3211234567", "type": "Email", "value": "email@domain.com"}'
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
to | string |  | Your FracTEL &reg; phone number.
type | string | | Message service routing type. Allowed values are `Device`, `Email`, `URL`, `Forward`, or `None`. See **Notes** for additional information.
value | string | | Value of the chosen message routing type. Allows for a _Device ID_, _Email Address_, _URL_ or _Phone Number_ depending on the specified `type`. See **Notes** for additional information.

### Notes

#### `type`

Incoming messages can be diverted to a single destination -- a `Device` (most likely a desk or mobile telephone), a valid `Email` address, a callback `URL`, or `Forward` to another telephone number. There is also the option to set the destination to `None`, in which case messages are deleted upon receipt without any delivery. Use the `type` parameter to specify the type of destination.

#### `value`

The `value` parameter contains the corresponding setting for the destination.

`type` | `value` | `Example`
------ | ------- | --------
`Device` | The ID for the destination device | ???
`Email`  | An email address                  | bingo@stokes.com
`URL`    | A callback URL                    | https://api.yourserver.com/handler.php?msg={{msg}}
`Forward` | A forwarding phone number        | 3211234567
`None`    | _None_                           |

#### Callback Data

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string | | Phone number of recipient.
from | string | | Phone number of sender.
message | string | | Contents of the message.
uid | string | | Unique identifier for the message.

Callback URLs use the `POST` method and use token replacements to place callback data values in query string parameters. For example, the following partial query string maps each callback data value to parameters in the query string: <code>recipient={{to}}&sender={{from}}&message={{msg}}&id={{uid}}</code>

## Receive Notify

> Example Request

```shell
# Configure FracTEL phone number 3211234567 to receive a callback with
# JSON payload data (application/json) to url https://hookb.in/vDkMOVB9
# when a message is received.
$ curl --request POST
--url 'https://api.fractel.net/v2/message/receive_notify'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--header 'token: key'
--data '{"to": "3211234567", "method": "JSON", "url": "https%3A%2F%2Fhookb.in%2FvDkMOVB9"}'
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "SUCCESS"
}
```

Configure the callback URL to notify when a message is received. Each FracTEL &reg; phone number can be configured to use its own callback URL for handling receive notifications.

### HTTP Request

Method | Route
--------- | -------
**POST** | `/message/receive_notify`

### Body Parameters

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string |  | Your FracTEL &reg; phone number.
url | string | | Callback URL. See **Notes** for additional information.
method | string | | Allowed values are `GET`,`POST`, or `JSON`. See **Notes** for additional information.

### Notes

#### `url`

This is a valid HTTP or HTTPS URL that will accept callback data when a message is sent to the FracTEL &reg; phone number specified in `from`.

#### `method`

One of three available methods must be specified for the callback execution.
- `GET` returns data through query string parameters on a `GET` to the given URL.
- `POST` returns data as _(application/x-www-form-urlencoded)_ in the body of a `POST` to the given URL.
- `JSON` returns data as _(application/json)_ in the body of a `POST` to the given URL.

#### Callback Data

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
to | string | | Phone number of recipient.
from | string | | Phone number of sender.
message | string | | Contents of the message.
uid | string | | Unique identifier for the message.

Callback URLs using the `GET` method use token replacements to place callback data values in query string parameters. For example, the following partial query string maps each callback data value to parameters in the query string: <code>recipient={{to}}&sender={{from}}&message={{msg}}&id={{uid}}</code>
