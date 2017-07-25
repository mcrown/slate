# Introduction

**Welcome to Fonestorm, the communications API platform powered by FracTEL!**

Fonestorm is compliant with the [OpenAPI Specification](https://www.openapis.org/). You can view code examples in the right column and you can switch the programming language of the examples with the tabs in the top right.

The Fonestorm API is organized around [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer). We utilize built-in HTTP features, such as HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. [JSON](http://www.json.org/) is returned by all API responses, including errors.

## Using Fonestorm

You will need an active FracTEL account with API access enabled to use the Fonestorm API. Call us at (321)499-1000 or email `sales@fonestorm.com` to get set up.

## Base URL

All URLs referenced in the documentation have the following base:

`https://api.fonestorm.com/v2`

## Dates and Times

Representation of dates and times are in [Coordinated Universal Time](https://en.wikipedia.org/wiki/Coordinated_Universal_Time) (_UTC_). The Fonestorm API accepts and returns dates and times that are represented using [ISO 8601]() formats.

## Rate limiting

Standard Fonestorm accounts are limited to 10 requests per second. Requests that exceed this rate will be rejected. Contact us if your project requires a higher transaction rate.
