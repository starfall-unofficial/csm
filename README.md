This addon exposes information of entities with specific classes.

Example:
```lua
--@server

for _, e in pairs(find.byClass("gmod_wire_expression2")) do
  print("E2: " .. e:getName())
end
```
