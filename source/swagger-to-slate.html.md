--- 

title: FracTEL API 2.0 

language_tabs: 
   - shell 

toc_footers: 
   - <a href='#'>Sign Up for a Developer Key</a> 
   - <a href='https://github.com/lavkumarv'>Documentation Powered by lav</a> 

includes: 
   - errors 

search: true 

--- 

# Introduction 

**Version:** 2.0.0 

# Authentication 

|apiKey|*API Key*|
|---|---| 

# /AUTH
## ***POST*** 

**Summary:** Obtain a FracTEL Auth token

**Description:** Returns a token that can be used to make authenticated requests

### HTTP Request 
`***POST*** /auth` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| username | formData | FracTEL username | Yes | string |
| password | formData | FracTEL password | Yes | string |
| expires | formData | FracTEL Token Life Time in Seconds | Default is 3600 seconds | Maximum is 24 hours | No | integer |

**Responses**

| Code | Description |
| ---- | ----------- |
| default | Successful |

# /SMS
## ***POST*** 

**Summary:** Send an SMS on the FracTEL infrastructure

**Description:** Returns a JSON response

### HTTP Request 
`***POST*** /sms` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| to | formData | The recipient's 10 digits phone number. | Yes | string |
| from | formData | Your FracTEL phone number | Yes | string |
| message | formData | Content of SMS | Yes | string |
| media_url | formData | URL for media for send via SMS (up to 10) | No | array |
| confirmation_url | formData | Callback URL for confirmation | No | string |
| require_confirmation | formData | Only send message if confirmation is available | No | boolean |

**Responses**

| Code | Description |
| ---- | ----------- |
| default | Successful |

# /SMS/{TO}/CALLBACK/{TYPE}
## ***PUT*** 

**Summary:** Set the callback URL for SMS services.

**Description:** Returns a JSON response

### HTTP Request 
`***PUT*** /sms/{to}/callback/{type}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| to | path | Your FracTEL phone number. | Yes | string |
| type | path | Callback type. | Yes | string |
| method | formData | Callback URL method. | Yes | string |
| url | formData | Callback URL. | Yes | string |
| url_username | formData | Callback auth username. | No | string |
| url_password | formData | Callback auth password. | No | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| default | Successful |

<!-- Converted with the swagger-to-slate https://github.com/lavkumarv/swagger-to-slate -->
