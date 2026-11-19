-- Threat: !InfrastructureShared
-- Name: 7078817c65ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
