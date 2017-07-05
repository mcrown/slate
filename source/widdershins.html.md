Compiling all doT templates...
Compiling authentication.dot to function
Compiling authentication_none.dot to function
Compiling code_http.dot to function
Compiling code_java.dot to function
Compiling code_javascript.dot to function
Compiling code_nodejs.dot to function
Compiling code_python.dot to function
Compiling code_ruby.dot to function
Compiling code_shell.dot to function
Compiling discovery.dot to function
Compiling footer.dot to function
Compiling heading_body_parameter.dot to function
Compiling heading_code_samples.dot to function
Compiling heading_example_responses.dot to function
Compiling heading_main.dot to function
Compiling parameters.dot to function
Compiling response_headers.dot to function
Compiling responses.dot to function
Compiling security.dot to function
---
title: FracTEL API 2.0 v2.0.0
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - javascript--nodejs: Node.JS
  - python: Python
  - ruby: Ruby
  - java: Java
toc_footers: []
includes: []
search: true
highlight_theme: darkula
---

# FracTEL API 2.0 v2.0.0

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.


Base URL = <a href="http://api.fractel.net/v2">http://api.fractel.net/v2</a>



# Authentication


* API Key
    - Parameter Name: **token**, in: header. 



# auth

## postAuth

> Code samples

```shell
# You can also use wget
curl -X post http://api.fractel.net/v2/auth \
  -H 'Content-Type: application/x-www-form-urlencoded'

```

```http
POST http://api.fractel.net/v2/auth HTTP/1.1
Host: api.fractel.net
Content-Type: application/x-www-form-urlencoded

```

```javascript
var headers = {
  'Content-Type':'application/x-www-form-urlencoded'

};

$.ajax({
  url: 'http://api.fractel.net/v2/auth',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Content-Type':'application/x-www-form-urlencoded'

};

fetch('http://api.fractel.net/v2/auth',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/x-www-form-urlencoded'
}

result = RestClient.post 'http://api.fractel.net/v2/auth', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
}

r = requests.post('http://api.fractel.net/v2/auth', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("http://api.fractel.net/v2/auth");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

`POST /auth`

*Obtain a FracTEL Auth token*

Returns a token that can be used to make authenticated requests

### Parameters

Parameter|In|Type|Required|Description
---|---|---|---|---|
username|formData|string|true|FracTEL username
password|formData|string|true|FracTEL password
expires|formData|integer|false|FracTEL Token Life Time in Seconds | Default is 3600 seconds | Maximum is 24 hours


### Responses

Status|Meaning|Description
---|---|---|
default|Default|Successful

> Example responses

<aside class="success">
This operation does not require authentication
</aside>

# sms

## postSms

> Code samples

```shell
# You can also use wget
curl -X post http://api.fractel.net/v2/sms \
  -H 'Content-Type: application/x-www-form-urlencoded'

```

```http
POST http://api.fractel.net/v2/sms HTTP/1.1
Host: api.fractel.net
Content-Type: application/x-www-form-urlencoded

```

```javascript
var headers = {
  'Content-Type':'application/x-www-form-urlencoded'

};

$.ajax({
  url: 'http://api.fractel.net/v2/sms',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Content-Type':'application/x-www-form-urlencoded'

};

fetch('http://api.fractel.net/v2/sms',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/x-www-form-urlencoded'
}

result = RestClient.post 'http://api.fractel.net/v2/sms', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
}

r = requests.post('http://api.fractel.net/v2/sms', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("http://api.fractel.net/v2/sms");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

`POST /sms`

*Send an SMS on the FracTEL infrastructure*

Returns a JSON response

### Parameters

Parameter|In|Type|Required|Description
---|---|---|---|---|
to|formData|string|true|The recipient's 10 digits phone number.
from|formData|string|true|Your FracTEL phone number
message|formData|string|true|Content of SMS
media_url|formData|array[string]|false|URL for media for send via SMS (up to 10)
confirmation_url|formData|string|false|Callback URL for confirmation
require_confirmation|formData|boolean|false|Only send message if confirmation is available


### Responses

Status|Meaning|Description
---|---|---|
default|Default|Successful

> Example responses

<aside class="success">
This operation does not require authentication
</aside>

## putSmsToCallbackType

> Code samples

```shell
# You can also use wget
curl -X put http://api.fractel.net/v2/sms/{to}/callback/{type} \
  -H 'Content-Type: application/x-www-form-urlencoded'

```

```http
PUT http://api.fractel.net/v2/sms/{to}/callback/{type} HTTP/1.1
Host: api.fractel.net
Content-Type: application/x-www-form-urlencoded

```

```javascript
var headers = {
  'Content-Type':'application/x-www-form-urlencoded'

};

$.ajax({
  url: 'http://api.fractel.net/v2/sms/{to}/callback/{type}',
  method: 'put',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Content-Type':'application/x-www-form-urlencoded'

};

fetch('http://api.fractel.net/v2/sms/{to}/callback/{type}',
{
  method: 'PUT',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/x-www-form-urlencoded'
}

result = RestClient.put 'http://api.fractel.net/v2/sms/{to}/callback/{type}', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
}

r = requests.put('http://api.fractel.net/v2/sms/{to}/callback/{type}', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("http://api.fractel.net/v2/sms/{to}/callback/{type}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PUT");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

`PUT /sms/{to}/callback/{type}`

*Set the callback URL for SMS services.*

Returns a JSON response

### Parameters

Parameter|In|Type|Required|Description
---|---|---|---|---|
to|path|string|true|Your FracTEL phone number.
type|path|string|true|Callback type.
method|formData|string|true|Callback URL method.
url|formData|string|true|Callback URL.
url_username|formData|string|false|Callback auth username.
url_password|formData|string|false|Callback auth password.


#### Enumerated Values

|Parameter|Value|
|---|---|
type|sms-trigger|
type|sms-url|
method|GET|
method|POST|
method|POSTJSON|

### Responses

Status|Meaning|Description
---|---|---|
default|Default|Successful

> Example responses

<aside class="success">
This operation does not require authentication
</aside>




