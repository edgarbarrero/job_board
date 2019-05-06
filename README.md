# JOB BOARD

Examples of usage:
* Register as a company
POST http://localhost:3000/job_board_api/v1/users?data[attributes[name]]=company_name&data[attributes[kind]]=company&data[type]=users

* register as a candidate
POST http://localhost:3000/job_board_api/v1/users?data[attributes[name]]=my_name&data[attributes[kind]]=candidate&data[type]=users

* Publish job adverts
POST http://localhost:3000/job_board_api/v1/jobs?data[attributes[title]]=job_title&data[attributes[description]]=job_description&data[attributes[company_id]]=1&data[type]=jobs

* Candidates can apply to job adverts
POST http://localhost:3000/job_board_api/v1/candidatures?data[attributes[user_id]]=1&data[attributes[job_id]]=1&data[attributes[state]]=received&data[type]=candidatures

* Manage candidates in those job adverts: highlight, reject, hire.
PATCH http://localhost:3000/job_board_api/v1/candidatures/1?data[attributes[user_id]]=1&data[attributes[job_id]]=1&data[type]=candidatures&data[attributes[state]]=highlighted

This app uses graffity gem. For more info about how to use it:

https://www.graphiti.dev/guides/
