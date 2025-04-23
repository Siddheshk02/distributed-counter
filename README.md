# distributed-counter

## This Move Smart-Contract has 3 different functions : 
### 1. Create a Counter (Shared Variable) :
Command : ``` sui client call
  --package <PACKAGE_ID>
  --module counter
  --function create
  --gas-budget 20000000 ```

### 2. Increment the Counter : 
Command : ``` sui client call
  --package <PACKAGE_ID>
  --module counter
  --function increment
  --args <COUNTER_OBJECT_ID>
  --gas-budget 20000000```

### 3. Set a Value for the Counter :
Command : ``` sui client call
  --package <PACKAGE_ID>
  --module counter
  --function set_value
  --args <COUNTER_OBJECT_ID> <NEW_VALUE>
  --gas-budget 20000000```
