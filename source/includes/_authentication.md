# Authentication

> Example Request

```shell
# Obtain an authentication token that is valid for two hours.
$ curl --request POST
--url 'https://api.fractel.net/v2/auth'
--header 'Content-Type: application/json'
--header 'Accept: application/json'
--data '{"username": "xxx", "password": "xxx", "expires": 7200}'
```

> Example Response

```json
{
  "statusCode": 200,
  "result": "REGISTERED",
  "token": "1825a1831d69218d474d6829501ac644",
  "expires": "2017-07-13T21:19:30.000Z"
}
```

Fonestorm uses an API key to allow access to the API. Fonestorm expects for the API key to be included in all API requests to the server in a header that looks like the following:

`token: key`

<aside class="notice">
You must replace <code>key</code> with your own API key.
</aside>

The authentication endpoint allows you to obtain an authentication token that can be used to make authenticated requests to protected endpoints.

### HTTP Request

Method | Route
--------- | -------
**POST** | `/auth`

### Body Parameters

Parameter | Type | Default | Description
--------- | ------- | ----------- | -----------
username | string |  |FracTEL &reg; username.
password | string | | FracTEL &reg; password.
expires<br/>_optional_ | integer | 3600 | Token time to live in seconds. The maximum allowed time is 24 hours.

<aside class="notice">
API calls that use invalid or expired tokens will receive a response of `401 - Unauthorized`.
</aside>
