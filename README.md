# Curl Generator

### pre requisites

install dependencies

```
sudo apt-get install curl jq
```

### how to use

download the project

```
git clone https://github.com/oliveira-andre/curl_generator.git
cd curl_generator
```

execute the project using bash

```
bash curl_generator.sh
```

### About options

first option - type your url without protocol 
```
example: localhost:3000
```

secound option - select your protocol
```
example: 1
```

third option - select your http method
```
example: 1
```

fourth option - put the number of headers you will need
```
example: 3
```

fifth option - select your headers or create your own
```
example: 3
example: 4
```

```
example of custom header: Authorization: Token
```

the output will be your perfect curl code
