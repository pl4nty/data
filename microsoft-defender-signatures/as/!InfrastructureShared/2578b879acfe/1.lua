-- Threat: !InfrastructureShared
-- Name: 2578b879acfe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
