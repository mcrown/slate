# Errors

Fonestorm uses conventional HTTP response codes to indicate the success or failure of an API request. Codes in the 2xx range indicate success, codes in the 4xx range indicate an error that failed given the information provided and codes in the 5xx range indicate an error with our servers.

## Client Errors

Fonestorm API uses the following HTTP status codes for client errors:

Code | Error | Description
---------- | ------- | -------
400 | Bad Request | The server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing).
401 | Unauthorized | The request has not been applied because it lacks valid authentication credentials for the target resource.
402 | Payment Required | The target resource requires some form of digital cash or micropayment scheme.
403 | Forbidden | The server understood the request but refuses to authorize it.
404 | Not Found | The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.
405 | Method Not Allowed | The method received in the request-line is known by the origin server but not supported by the target resource.
406 | Not Acceptable | The target resource does not have a current representation that would be acceptable to the user agent, according to the proactive negotiation header fields received in the request, and the server is unwilling to supply a default representation.
407 | Proxy Authentication Required | Similar to 401 Unauthorized, but it indicates that the client needs to authenticate itself in order to use a proxy.
408 | Request Time-Out | The server did not receive a complete request message within the time that it was prepared to wait.
409 | Conflict | The request could not be completed due to a conflict with the current state of the target resource. This code is used in situations where the user might be able to resolve the conflict and resubmit the request.
410 | Gone | The target resource is no longer available at the origin server and that this condition is likely to be permanent.
411 | Length Required | The server refuses to accept the request without a defined Content-Length.
412 | Precondition Failed | One or more conditions given in the request header fields evaluated to false when tested on the server.
413 | Request Entity Too Large | The server is refusing to process a request because the request payload is larger than the server is willing or able to process.
414 | Request-URI Too Large | The server is refusing to service the request because the request-target is longer than the server is willing to interpret.
415 | Unsupported Media Type | The origin server is refusing to service the request because the payload is in a format not supported by this method on the target resource.
416 | Requested Range Not Satisfiable | None of the ranges in the request's Range header field overlap the current extent of the selected resource or that the set of ranges requested has been rejected due to invalid ranges or an excessive request of small or overlapping ranges.
417 | Expectation Failed | The expectation given in the request's Expect header field could not be met by at least one of the inbound servers.
422 | Unprocessable Entity | The server understands the content type of the request entity and the syntax of the request entity is correct, but was unable to process the contained instructions.
423 | Locked | The source or destination resource of a method is locked.
428 | Precondition Required | The origin server requires the request to be conditional.
429 | Too Many Requests | The user has sent too many requests in a given amount of time ("rate limiting").
451 | Unavailable For Legal Reasons | The server is denying access to the resource as a consequence of a legal demand.

## Server Errors

Fonestorm API uses the following HTTP status codes for server errors:

Code | Error | Description
---------- | ------- | -------
500 | Internal Server Error | The server encountered an unexpected condition that prevented it from fulfilling the request.
501 | Not Implemented | The server does not support the functionality required to fulfill the request.
502 | Bad Gateway | The server, while acting as a gateway or proxy, received an invalid response from an inbound server it accessed while attempting to fulfill the request.
503 | Service Unavailable | The server is currently unable to handle the request due to a temporary overload or scheduled maintenance, which will likely be alleviated after some delay.
504 | Gateway Time-Out | The server, while acting as a gateway or proxy, did not receive a timely response from an upstream server it needed to access in order to complete the request.
