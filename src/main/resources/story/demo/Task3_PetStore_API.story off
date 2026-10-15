Narrative:
As a QA engineer
I want to test PetStore API endpoints
So that user management, authentication, and pet lifecycle operations work correctly

Scenario: 1. Verify a user can be created
Given request body: {"id": 1001, "username": "testuser_api", "firstName": "Test", "lastName": "User", "email": "test@petstore.com", "password": "password123", "phone": "1234567890", "userStatus": 1}
When I issue HTTP POST request
Then response code is equal to `200`

Scenario: 2. Verify a user can log in
When I execute a HTTP GET request for a resource with relative URL `/user/login?username=testuser_api&password=password123`
Then response code is equal to `200`
Then response body contains `logged in user session`

Scenario: 3. Verify a list of users can be created
Given request body: [{"id": 1002, "username": "user_array_1", "firstName": "User", "lastName": "One", "email": "user1@petstore.com", "password": "password123", "phone": "1234567890", "userStatus": 1}]
When I execute a HTTP POST request for a resource with relative URL `/user/createWithArray`
Then response code is equal to `200`

Scenario: 4. Verify a user can log out
When I execute a HTTP GET request for a resource with relative URL `/user/logout`
Then response code is equal to `200`

Scenario: 5. Verify a new pet can be added
Given request body: {"id": 999888, "category": {"id": 1, "name": "Dogs"}, "name": "Rex", "photoUrls": ["https://example.com/rex.jpg"], "tags": [{"id": 1, "name": "friendly"}], "status": "available"}
When I execute a HTTP POST request for a resource with relative URL `/pet`
Then response code is equal to `200`

Scenario: 6. Verify a pet's image can be updated
When I execute a HTTP POST request for a resource with relative URL `/pet/999888/uploadImage`
Then response code is equal to `200`

Scenario: 7. Verify a pet's name and status can be updated
Given request body: {"id": 999888, "category": {"id": 1, "name": "Dogs"}, "name": "RexUpdated", "photoUrls": ["https://example.com/rex.jpg"], "tags": [{"id": 1, "name": "friendly"}], "status": "pending"}
When I execute a HTTP PUT request for a resource with relative URL `/pet`
Then response code is equal to `200`

Scenario: 8. Verify a pet can be deleted
When I execute a HTTP DELETE request for a resource with relative URL `/pet/999888`
Then response code is equal to `200`
