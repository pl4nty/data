-- Threat: !InfrastructureShared
-- Name: 3c78d9dc032c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
