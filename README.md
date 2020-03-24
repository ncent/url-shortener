# url-shortener

This is a url-shortener backend functionality for the arber app, using serverless/lambda, written in golang

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

```
GO
Node
npm
Serverless Framework
go dep
```

### Installing

Install Serverless Framework

```
npm install -g serverless
```

Install node dependencies

```
npm install
```

## Building

```
make build
```

## Running the tests

```
go test ./...
```

## Deployment

Development environment
```
SLS_DEBUG=* serverless deploy --verbose --stage development
```

Production environment
```
SLS_DEBUG=* serverless deploy --verbose --stage production
```

## Shortening a URL

```
$ curl $INVOKE_URL/shorten -X POST -d '{"url":"https://example.com"}'
{"short_url":"SHORT_URL"}
```

## Accessing the URL
```
Navigate to INVOKE_URL/SHORT_URL
```

## Built With

* [GO](https://golang.org) - The Language
* [Serverless Framework](https://serverless.com) - Deployment Framework
* [ElasticCache](https://aws.amazon.com/elasticache/) - Used to store data


## Authors

* **Rodrigo Serviuc Pavezi** - *Initial work* - [rodrigopavezi](https://gitlab.com/rodrigopavezi)
* **Eduardo Nunes Pereira** - [eduardonunesp](https://gitlab.com/eduardonunesp)
* **Arya Soltanieh** - [lostcodingsomewhere](https://gitlab.com/lostcodingsomewhere)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


