Meta:
@profile rest-api

Scenario: 1. Verify a user can be created
Given request body: {
  "id": 0,
  "username": "user_${generate-random-uuid}",
  "firstName": "Margarita",
  "lastName": "QA",
  "email": "margarita_${generate-random-uuid}@test.com",
  "password": "Password123",
  "phone": "1234567890",
  "userStatus": 1
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user`
Then response code is equal to `200`

Scenario: 2. Verify a user can log in
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login?username=margarita_qa&password=Password123`
Then response code is equal to `200`

Scenario: 3. Verify a list of users can be created
Given request body: [
  {
    "id": 101,
    "username": "user_qa_1",
    "firstName": "Margarita",
    "lastName": "QA",
    "email": "margarita1@test.com",
    "password": "Password123",
    "phone": "1234567890",
    "userStatus": 1
  },
  {
    "id": 102,
    "username": "user_qa_2",
    "firstName": "Test",
    "lastName": "User",
    "email": "margarita2@test.com",
    "password": "Password123",
    "phone": "0987654321",
    "userStatus": 1
  }
]
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user/createWithArray`
Then response code is equal to `200`

Scenario: 4. Verify a user can log out
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/logout`
Then response code is equal to `200`

Scenario: 5. Verify a new pet can be added
Given request body: {
  "id": 10,
  "category": {
    "id": 1,
    "name": "Dogs"
  },
  "name": "Rex",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 1,
      "name": "friendly"
    }
  ],
  "status": "available"
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet`
Then response code is equal to `200`

Scenario: 6. Verify a pet’s image can be updated
When I set request headers:
|name        |value               |
|Content-Type|multipart/form-data |
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/10/uploadImage`
Then response code is equal to `200`

Scenario: 7. Verify a pet’s name and status can be updated
When I set request headers:
|name         |value                                 |
|Content-Type |application/x-www-form-urlencoded     |
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/10?name=RexUpdated&status=sold`
Then response code is equal to `200`

Scenario: 8. Verify a pet can be deleted
When I set request headers:
|name   |value      |
|api_key|special-key|
When I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/pet/10`
Then response code is equal to `200`

Scenario: 9 Verify a pet’s image can be updated(Перевірити сам факт звернення до ендпоінта)
When I set request headers:
|name        |value               |
|Content-Type|multipart/form-data |
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/10/uploadImage`
Then response code is equal to `400`

Scenario: 10 Verify a pet’s image can be updated
Given request body: #{toMultipartEntity(file, classpath:image.jpg)}
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/10/uploadImage`
Then response code is equal to `200`

Scenario: Verify a pet’s image can be updated
Given request body: #{(toMultipartEntity(file, classpath:image.jpg))}
When I set request headers:
|name        |value               |
|Content-Type|multipart/form-data |
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/10/uploadImage`
Then response code is equal to `200`
