Meta:
@profile rest-api

Scenario: Verify a user can be created
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
When I send a HTTP POST request to a relative URL '/user'
Then response code is equal to `200`

