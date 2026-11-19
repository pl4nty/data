-- Threat: !InfrastructureShared
-- Name: d37859e8c47b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
