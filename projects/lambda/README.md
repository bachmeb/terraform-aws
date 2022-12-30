# aws terraform project - lambda

### Python Virtual Environment
https://docs.python.org/3/library/venv.html

``` 
mkdir python/venv
python3 -m venv python/venv/
source python/venv/bin/activate
```
### Lambda Basic Execution Role
https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html

### Test
``` 
aws lambda invoke --function-name asdf-2 output.txt
```